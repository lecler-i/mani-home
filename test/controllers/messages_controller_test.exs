defmodule Manihome.MessagesControllerTest do
  use Manihome.ConnCase

  alias Manihome.Messages
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, messages_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    messages = Repo.insert! %Messages{}
    conn = get conn, messages_path(conn, :show, messages)
    assert json_response(conn, 200)["data"] == %{"id" => messages.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, messages_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, messages_path(conn, :create), messages: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Messages, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, messages_path(conn, :create), messages: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    messages = Repo.insert! %Messages{}
    conn = put conn, messages_path(conn, :update, messages), messages: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Messages, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    messages = Repo.insert! %Messages{}
    conn = put conn, messages_path(conn, :update, messages), messages: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    messages = Repo.insert! %Messages{}
    conn = delete conn, messages_path(conn, :delete, messages)
    assert response(conn, 204)
    refute Repo.get(Messages, messages.id)
  end
end
