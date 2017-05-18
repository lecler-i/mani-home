defmodule Manihome.JwtAuthPlug do
  import Plug.Conn
  alias Manihome.Repo
  
  def init(_opts) do
    %{}
  end

  def call(conn, _opts) do
    claims = conn.assigns.joken_claims
    case Repo.get_by(Manihome.User, auth0_id: claims["sub"]) do
      nil -> send_resp(conn, 403, "forbidden") 
      user ->
        conn |> assign(:user, user)
    end
  end

end

