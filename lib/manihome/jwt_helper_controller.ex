defmodule Manihome.JwtHelperController do
  defmacro __using__(opts \\ []) do
    key = Keyword.get(opts, :key, :default)
    quote do
      def action(conn, _opts) do
        apply(
          __MODULE__,
          action_name(conn),
          [
            conn,
            conn.params,
            conn.assigns.user,
            conn.assigns.joken_claims
          ]
        )
      end
    end
  end
end