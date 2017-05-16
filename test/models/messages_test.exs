defmodule Manihome.MessagesTest do
  use Manihome.ModelCase

  alias Manihome.Messages

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Messages.changeset(%Messages{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Messages.changeset(%Messages{}, @invalid_attrs)
    refute changeset.valid?
  end
end
