defmodule Manihome.Chat do
  use Manihome.Web, :model

  alias Manihome.Repo
  alias Manihome.User
  alias Manihome.Message

@derive {Poison.Encoder, only: [
  :id,
  :users,
  :messages
]}
  schema "chats" do
    many_to_many :users, User, join_through: "users_chats" 
    has_many :messages, Message, on_delete: :delete_all
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    users = Enum.map params["users"], fn id ->
      User
      |> Repo.get!(id)
    end

    struct
    |> Repo.preload(:users)
    |> cast(params, [])
    |> put_assoc(:users, users)
    |> validate_required([])
  end
end
