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

end
