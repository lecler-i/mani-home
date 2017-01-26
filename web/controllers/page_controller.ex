defmodule Manihome.PageController do
  use Manihome.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
