# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :manihome,
  ecto_repos: [Manihome.Repo]

  # Config Arc - File Uploader
config :arc,
  storage: Arc.Storage.Local
# Configures the endpoint
config :manihome, Manihome.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "opimeM+xnzZjFLv78FZwbuNXykqq4S+njrBGQYSQcMXz+1a/EcHKeTql9iIwHcNl",
  render_errors: [view: Manihome.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Manihome.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
