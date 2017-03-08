defmodule Manihome.Repo do

  @moduledoc """
  Memory Repository
  """

  def all(Manihome.User) do
    [
      %Manihome.User{id: "1", mail: "test@test.com", name: "Moi", surname: "Pastoi", password: "manihime"},

      %Manihome.User{id: "2", mail: "tesqt@test.com", name: "Toi", surname: "PasMoi", password: "manihome"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
