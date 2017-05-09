defmodule Manihome.Accommodation do
  use Manihome.Web, :model

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
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name type rent_price rent_freq room_nbr contract_type date_begin draft), [])
  end


end

