defmodule Manihome.PageController do
  use Manihome.Web, :controller

  def index(conn, _params) do
    render conn, :index, version: "0.0.1", status: "ok"
  end
end
