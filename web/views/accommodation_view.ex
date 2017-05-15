defmodule Manihome.AccommodationView do
  use Manihome.Web, :view

  def render("index.json", %{accommodations: accommodations}) do
    %{ 
      data: render_many(accommodations, Manihome.AccommodationView, "acco_assoc.json")
      
    }
  end

  def render("show.json", %{accommodation: accommodation}) do
    %{
      data: render_one(accommodation, Manihome.AccommodationView, "acco_assoc.json")
    }
  end

  def render("acco_assoc.json", %{accommodation: accommodation}) do
    accommodation
  end

  def render("accommodation.json", %{accommodation: accommodation}) do
    accommodation
  end

end

