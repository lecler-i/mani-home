defmodule Manihome.Repo.Migrations.CreateTableUsers_Chats do
  use Ecto.Migration

  def change do
    create table(:users_chats, primary_key: false) do
      add :user_id, references(:users)
      add :chat_id, references(:chats)
    end

  end
end
