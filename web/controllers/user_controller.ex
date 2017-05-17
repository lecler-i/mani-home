defmodule Manihome.UserController do
  use Manihome.Web, :controller
  
  alias Manihome.User

  def index(conn, _params) do
    users = Repo.all(Manihome.User)
    render conn, "index.json", users: users
  end

   def show(conn, %{"id" => id}) do
    user = Repo.get(Manihome.User, id)
    render conn, "show.json", user: user
  end

   def create(conn, %{"user" => user_params}) do
     IO.inspect user_params
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

  def login(conn, _params) do
    truc = %{success: true}
    render(conn, "status.json", status: conn.assigns)
  end


end
