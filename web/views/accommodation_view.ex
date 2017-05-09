defmodule Manihome.AccommodationView do
  use Manihome.Web, :view

  def render("index.json", %{accommodations: accommodations}) do
    %{
      nbrs: length(accommodations),
      accommodations: accommodations
    }
  end

  def accommodation_json(accommodation) do
    %{
      name: accommodation.name,
      type: accommodation.type,
      longitude: accommodation.longitude,
      latitude: accommodation.latitude,
      rent_price: accommodation.rent_price,
      room_nbr: accommodation.room_nbr,
      room_available: accommodation.room_available,
      contract_type: accommodation.contract_type
    }
  end

end

