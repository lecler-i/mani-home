defmodule Manihome.Repo.Migrations.UserAuth do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :avatar, :string
      add :auth0_id, :string
    end

  end
end
