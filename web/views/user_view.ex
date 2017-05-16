defmodule Manihome.UserView do
  use Manihome.Web, :view

  def render("index.json", %{users: users}) do
    %{ 
      data: render_many(users, Manihome.UserView, "user.json")
    }
  end

  def render("show.json", %{user: user}) do
    %{
      data: render_one(user, Manihome.UserView, "user.json")
    }
  end

  def render("user.json", %{user: user}) do
    user
  end

end
