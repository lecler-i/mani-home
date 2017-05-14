defmodule Manihome.AccommodationMediasControllerTest do
  use Manihome.ConnCase

  alias Manihome.AccommodationMedias
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, accommodation_medias_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    accommodation_medias = Repo.insert! %AccommodationMedias{}
    conn = get conn, accommodation_medias_path(conn, :show, accommodation_medias)
    assert json_response(conn, 200)["data"] == %{"id" => accommodation_medias.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, accommodation_medias_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, accommodation_medias_path(conn, :create), accommodation_medias: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(AccommodationMedias, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, accommodation_medias_path(conn, :create), accommodation_medias: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    accommodation_medias = Repo.insert! %AccommodationMedias{}
    conn = put conn, accommodation_medias_path(conn, :update, accommodation_medias), accommodation_medias: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(AccommodationMedias, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    accommodation_medias = Repo.insert! %AccommodationMedias{}
    conn = put conn, accommodation_medias_path(conn, :update, accommodation_medias), accommodation_medias: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    accommodation_medias = Repo.insert! %AccommodationMedias{}
    conn = delete conn, accommodation_medias_path(conn, :delete, accommodation_medias)
    assert response(conn, 204)
    refute Repo.get(AccommodationMedias, accommodation_medias.id)
  end
end
