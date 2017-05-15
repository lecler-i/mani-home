defmodule Manihome.AccommodationMediaTest do
  use Manihome.ModelCase

  alias Manihome.AccommodationMedia

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AccommodationMedia.changeset(%AccommodationMedia{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AccommodationMedia.changeset(%AccommodationMedia{}, @invalid_attrs)
    refute changeset.valid?
  end
end
