defmodule Manihome.UserController do
  use Manihome.Web, :controller
  use Manihome.JwtHelperController 
  alias Manihome.User

  def index(conn, _params, _user) do
    users = Repo.all(Manihome.User)
    render conn, "index.json", users: users
  end

   def show(conn, _params, user) do
    render conn, "show.json", user: user
  end

   def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
    {:ok, user} ->
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render(:user, user: user)
    {:error, changeset} ->
      conn
      |> render(Manihome.ChangesetView, :error, changeset: changeset)
    end
   end

  def delete(conn, %{"id" => id}) do
    user = User 
           |> Repo.get!(id)
           |> Repo.preload(:accommodations)

    Repo.delete!(user)

    send_resp(conn, :no_content, "")
  end

  def login(conn, %{"user" => user_params}) do
    claims = conn.assigns.joken_claims
    user = case Repo.get_by(User, auth0_id: claims["sub"]) do
      nil -> 
        put_status(conn, :created)
        %User{}
      user -> user
    end
    result = user
    |> User.jtw_changeset(user_params, %{auth0_id: claims["sub"]})
    |> Repo.insert_or_update

    case result do
      {:ok, user} ->
        conn
        |> put_resp_header("location", user_path(conn, :show, user))
        |> render(:user, user: user)
      {:error, changeset} ->
        conn
        |> render(Manihome.ChangesetView, :error, changeset: changeset)
    end
  end


end
