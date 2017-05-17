defmodule Manihome.JWTHelper do
  import Joken, except: [verify: 1]

  @doc """
  use for future verification, eg. on socket connect
  """
  def verify(jwt) do
    verify
    |> with_json_module(Poison)
    |> with_compact_token(jwt)
    |> Joken.verify
  end

  @doc """
  use for verification via plug
  issuer should be our auth0 domain
  app_metadata must be present in id_token
  """
  def verify do
    %Joken.Token{}
    |> with_json_module(Poison)
    |> with_signer(hs256("VugOcfMgtl5Zqup32JZqAq6LtO7waZUkCuYoKMVxwxGvXQW8SfduW86DO0n14hNR"))
  end

  @doc """
  Create token from client id and secret
  Used for unit tests
  """

  @doc """
  Return error message for `on_error`
  """
  def error(conn, _msg) do
    {conn, %{:errors => %{:detail => "unauthorized"}}}
  end

end
