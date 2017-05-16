defmodule Manihome.Accommodation do
  use Manihome.Web, :model

@derive {Poison.Encoder, only: [
  :id,
  :name,
  :type,
  :longitude,
  :latitude,
  :rent_price,
  :date_end,
  :room_nbr,
  :room_available,
  :contract_type,
  :date_begin,
  :draft,
  :accommodation_medias]}

  schema "accommodations" do
    field :name, :string
    field :type, AccommodationType
    field :longitude, :float
    field :latitude, :float
    field :rent_price, :integer
    field :date_end, :utc_datetime
    field :room_nbr, :integer
    field :room_available, :integer
    field :contract_type, ContractType
    field :date_begin, :utc_datetime
    field :draft, :boolean
    timestamps()

    has_many :accommodation_medias, Manihome.AccommodationMedia, on_delete: :delete_all

  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name type longitude latitude rent_price room_nbr room_available contract_type date_begin draft), [])
  end


end

