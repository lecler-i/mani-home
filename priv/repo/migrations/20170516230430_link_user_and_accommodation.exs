defmodule Manihome.Repo.Migrations.LinkUserAndAccommodation do
  use Ecto.Migration

  def change do
    alter table(:accommodations) do
      add :user_id, references(:users)
    end
  end
end
