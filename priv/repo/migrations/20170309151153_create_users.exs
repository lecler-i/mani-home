defmodule Manihome.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :surname, :string
      add :mail, :string
      add :password, :string, virtual: true
      add :password_hash, :string

      timestamps()
    end
  end
end
