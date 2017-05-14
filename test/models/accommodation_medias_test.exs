defmodule Manihome.AccommodationMediasTest do
  use Manihome.ModelCase

  alias Manihome.AccommodationMedias

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AccommodationMedias.changeset(%AccommodationMedias{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AccommodationMedias.changeset(%AccommodationMedias{}, @invalid_attrs)
    refute changeset.valid?
  end
end
