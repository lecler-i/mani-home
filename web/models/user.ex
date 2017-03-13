defmodule Manihome.User do
  use Manihome.Web, :model

  schema "users" do
   field :name, :string
   field :surname, :string
   field :mail, :string
   field :password, :string, virtual: true
   field :password_hash, :string

   timestamps()
  end
  
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name surname mail), [])
    |> validate_length(:name, min: 1, max: 20)
  end

end
