defmodule Manihome.User do
  use Manihome.Web, :model

@derive {Poison.Encoder, only: [
  :id,
  :name,
  :surname,
  :mail
]}
  schema "users" do
    field :name, :string
    field :surname, :string
    field :mail, :string
    field :password, :string, virtual: true
    field :password_hash, :string
 
    has_many :chats, Manihome.Chat
    has_many :messages, Manihome.Message
   timestamps()
  end
  
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name surname mail), [])
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password))
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end

  end

end
