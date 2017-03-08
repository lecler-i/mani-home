defmodule Manihome.UserController do
  use Manihome.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Manihome.User)
    render conn, "index.html", users: users
  end

   def show(conn, %{"id" => id}) do
     IO.puts Manihome.User
      user = Repo.get(Manihome.User, id)
      IO.puts id 
      IO.puts "hello"
      render conn, "show.html", user: user
  end
end
