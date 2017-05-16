defmodule Manihome.Message do
  use Manihome.Web, :model

  schema "message" do
    field :text, :string

    belongs_to :user, Manihome.User
    belongs_to :chat, Manihome.Chat
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
