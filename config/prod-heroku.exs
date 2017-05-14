use Mix.Config

config :manihome, Manihome.Endpoint,
  url: [scheme: "https", host: "https://mani-home-prod.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],  http: [port: {:system, "PORT"}],
  cache_static_manifest: "priv/static/manifest.json"
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :logger, level: :info

# Configure your database
config :manihome, Manihome.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true

# import_config "prod.secret.exs"
