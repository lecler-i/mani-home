defmodule Manihome.AccommodationView do
  use Manihome.Web, :view

  def render("index.json", %{accommodations: accommodations}) do
    %{ 
      data: render_many(accommodations, Manihome.AccommodationView, "accommodation.json")
    }
  end

  def render("show.json", %{accommodation: accommodation}) do
    %{
      data: render_one(accommodation, Manihome.AccommodationView, "accommodation.json")
    }
  end

  def render("accommodation.json", %{accommodation: accommodation}) do
    accommodation
  end

end

