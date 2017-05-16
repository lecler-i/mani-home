defmodule Manihome.Repo.Migrations.CreateChat do
  use Ecto.Migration

  def change do
    create table(:chats) do

      timestamps()
    end

    create table(:messages) do
      add :text, :string
      add :user_id, references(:users)
      add :chat_id, references(:chats)
      timestamps()
    end

    alter table(:users) do
      add :chat_id, references(:chats)
    end

  end
end
