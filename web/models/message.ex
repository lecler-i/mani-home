defmodule Manihome.Message do
  use Manihome.Web, :model

  alias Manihome.Repo

  @derive {Poison.Encoder, only: [
    :id,
    :text,
    :user,
    :inserted_at
  ]}

  schema "messages" do
    field :text, :string

    belongs_to :user, Manihome.User
    belongs_to :chat, Manihome.Chat
    timestamps()
  end
  
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, chat_id, params \\ %{}) do
    chat = Manihome.Chat
           |> Repo.get!(chat_id)
           |> Repo.preload(:messages)

    user = Manihome.User
           |> Repo.get!(params["user"])
           |> Repo.preload(:messages)

    struct
    |> Repo.preload(:chat)
    |> Repo.preload(:user)
    |> cast(params, [:text])
    |> put_assoc(:chat, chat)
    |> put_assoc(:user, user)
    |> validate_required([:user, :chat, :text])
  end
end
