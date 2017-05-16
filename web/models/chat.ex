defmodule Manihome.Chat do
  use Manihome.Web, :model

  alias Manihome.Repo
@derive {Poison.Encoder, only: [
  :id,
  :users,
  :messages
]}
  schema "chats" do
    has_many :users, Manihome.User
    has_many :messages, Manihome.Message, on_delete: :delete_all
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    users = Enum.map params["users"], fn id ->
      User
      |> Repo.get!(id)
      |> Repo.preload(:chats)
    end

    struct
    |> Repo.preload(:users)
    |> cast(params, [])
    |> put_assoc(:users, users)
    |> validate_required([])
  end
end
