defmodule Manihome.AccommodationController do
  use Manihome.Web, :controller

  alias Manihome.Accommodation

  def index(conn, _params) do
    accommodations = Repo.all(Manihome.Accommodation)
    render conn, :index, accommodations: accommodations
  end

end

