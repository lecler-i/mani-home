defmodule Manihome.AccommodationMediasControllerTest do
  # use Manihome.ConnCase

  # alias Manihome.AccommodationMedia
  # @valid_attrs %{}
  # @invalid_attrs %{}

  # setup %{conn: conn} do
  #   {:ok, conn: put_req_header(conn, "accept", "application/json")}
  # end

  # test "lists all entries on index", %{conn: conn} do
  #   conn = get conn, accommodation_media_path(conn, :index)
  #   assert json_response(conn, 200)["data"] == []
  # end

  # test "shows chosen resource", %{conn: conn} do
  #   accommodation_media = Repo.insert! %AccommodationMedia{}
  #   conn = get conn, accommodation_media_path(conn, :show, accommodation_media)
  #   assert json_response(conn, 200)["data"] == %{"id" => accommodation_media.id}
  # end

  # test "renders page not found when id is nonexistent", %{conn: conn} do
  #   assert_error_sent 404, fn ->
  #     get conn, accommodation_media_path(conn, :show, -1)
  #   end
  # end

  # test "creates and renders resource when data is valid", %{conn: conn} do
  #   conn = post conn, accommodation_media_path(conn, :create), accommodation_media: @valid_attrs
  #   assert json_response(conn, 201)["data"]["id"]
  #   assert Repo.get_by(AccommodationMedia, @valid_attrs)
  # end

  # test "does not create resource and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, accommodation_media_path(conn, :create), accommodation_media: @invalid_attrs
  #   assert json_response(conn, 422)["errors"] != %{}
  # end

  # test "updates and renders chosen resource when data is valid", %{conn: conn} do
  #   accommodation_media = Repo.insert! %AccommodationMedia{}
  #   conn = put conn, accommodation_media_path(conn, :update, accommodation_media), accommodation_media: @valid_attrs
  #   assert json_response(conn, 200)["data"]["id"]
  #   assert Repo.get_by(AccommodationMedia, @valid_attrs)
  # end

  # test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #   accommodation_media = Repo.insert! %AccommodationMedia{}
  #   conn = put conn, accommodation_media_path(conn, :update, accommodation_media), accommodation_media: @invalid_attrs
  #   assert json_response(conn, 422)["errors"] != %{}
  # end

  # test "deletes chosen resource", %{conn: conn} do
  #   accommodation_media = Repo.insert! %AccommodationMedias{}
  #   conn = delete conn, accommodation_media_path(conn, :delete, accommodation_media)
  #   assert response(conn, 204)
  #   refute Repo.get(AccommodationMedias, accommodation_media.id)
  # end
end
