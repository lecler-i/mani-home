defmodule Manihome.PageView do
  use Manihome.Web, :view

  def render("index.json", %{version: version, status: status}) do
    %{
      version: version,
      status: status
    }
  end

end
