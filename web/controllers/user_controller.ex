defmodule Manihome.UserController do
  use Manihome.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Manihome.User)
    render conn, "index.html", users: users
  end

  # def show(conn, params) do
  #end
end
