defmodule Manihome.AccommodationMediaController do
  use Manihome.Web, :controller

  alias Manihome.AccommodationMedia
  alias Manihome.Accommodation

  def create(conn, params) do
    acco = Repo.get!(Accommodation, params["accommodation_id"])
           |> Repo.preload(:accommodation_medias)
    acco_change = Ecto.Changeset.change(acco)
    IO.puts '----------------------'
     media_changeset = AccommodationMedia.changeset(%AccommodationMedia{}, params)
    # IO.puts media_changeset
    #media = Repo.insert!(media_changeset)
    acco_with_media = Ecto.Changeset.put_assoc(acco, :accommodation_medias, data: params["data"])
    Repo.insert!(acco_with_media) 

  end

  def show(conn, %{"id" => id}) do
  end

  def update(conn, %{"id" => id, "accommodation_medias" => accommodation_medias_params}) do
  end

  def delete(conn, %{"id" => id}) do
    accommodation_medias = Repo.get!(AccommodationMedia, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(accommodation_medias)

    send_resp(conn, :no_content, "")
  end
end
