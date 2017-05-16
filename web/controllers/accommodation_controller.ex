defmodule Manihome.AccommodationController do
  use Manihome.Web, :controller

  alias Manihome.Accommodation

  def index(conn, _params) do
    accommodations = Manihome.Accommodation
                     |> Repo.all
                     |> Repo.preload(:accommodation_medias)
    render conn, :index, accommodations: accommodations
  end

  def create(conn, %{"accommodation" => accommodation_params}) do
    changeset = Accommodation.changeset(%Accommodation{}, accommodation_params)
    case Repo.insert(changeset) do
      {:ok, accommodation} ->
        accommodation = %{accommodation | accommodation_medias: []}
        conn
        |> put_status(:created)
        |> put_resp_header("location", accommodation_path(conn, :show, accommodation))
        |> render(:accommodation, accommodation: accommodation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Manihome.ChangesetView, :error, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    accommodation = Accommodation
                    |> Repo.get!(id)
                    |> Repo.preload(:accommodation_medias)
    render(conn, "show.json", accommodation: accommodation)
  end

  def update(conn, %{"id" => id, "accommodation" => accommodation_params}) do
    accommodation = Repo.get!(Accommodation, id)
    changeset = Accommodation.changeset(accommodation, accommodation_params)

    case Repo.update(changeset) do
      {:ok, accommodation} ->
        render(conn, :show, accommodation: accommodation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Manihome.ChangesetView, :error, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    accommodation = Repo.get!(Accommodation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(accommodation)

    send_resp(conn, :no_content, "")
  end

end

