defmodule Manihome.Repo.Migrations.CreateAccommodationMedia do
  use Ecto.Migration

  def change do
    create table(:accommodation_medias) do
      add :accommodation_id, references(:accommodations)
      add :data, :string
      timestamps()
    end

  end
end
