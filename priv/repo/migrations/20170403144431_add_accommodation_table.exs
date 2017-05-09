defmodule Manihome.Repo.Migrations.AddAccommodationTable do
  use Ecto.Migration

  def change do
    AccommodationType.create_type
    ContractType.create_type

    create table(:accommodations) do
      add :name, :string
      add :type, :acco_type
      add :longitude, :float
      add :latitude, :float
      add :rent_price, :integer
      add :room_nbr, :integer
      add :room_available, :integer
      add :contract_type, :contract_type
      add :date_begin, :utc_datetime
      add :date_end, :utc_datetime
      add :draft, :boolean

      timestamps()
    end

  end
end
