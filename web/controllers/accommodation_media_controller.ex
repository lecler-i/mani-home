defmodule Manihome.AccommodationMediaController do
  use Manihome.Web, :controller

  alias Manihome.AccommodationMedia

  def create(conn, params) do
    media_changeset = AccommodationMedia.changeset(%AccommodationMedia{}, params)

    case Repo.insert(media_changeset) do
      {:ok, acco} ->
          conn
         |> put_status(:created)
         |> render(:show, accommodation_media: acco)
      {:error, changeset} ->
          conn
         |> put_status(:unprocessable_entity)
         |> render(Manihome.ChangesetView, :error, changeset: changeset)
       end
  end

  def show(conn, %{"id" => id}) do
    acco = Repo.get!(AccommodationMedia, id)
    conn
    |> render(:show, accommodation_media: acco)
  end

  def delete(conn, %{"id" => id}) do
    accommodation_medias = Repo.get!(AccommodationMedia, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(accommodation_medias)

    send_resp(conn, :no_content, "")
  end
end
