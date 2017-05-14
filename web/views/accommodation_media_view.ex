defmodule Manihome.AccommodationMediaView do
  use Manihome.Web, :view

  def render("index.json", %{accommodation_media: accommodation_media}) do
    %{data: render_many(accommodation_media, Manihome.AccommodationMediaView, "accommodation_media.json")}
  end

  def render("show.json", %{accommodation_media: accommodation_media}) do
    %{data: render_one(accommodation_media, Manihome.AccommodationMediaView, "accommodation_media.json")}
  end

  def render("accommodation_media.json", %{accommodation_media: accommodation_media}) do
    %{id: accommodation_media.id}
  end
end
