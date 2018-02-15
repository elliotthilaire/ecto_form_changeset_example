# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :form_changeset_example,
  ecto_repos: [FormChangesetExample.Repo]

# Configures the endpoint
config :form_changeset_example, FormChangesetExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jAquVgyzg6zdCL74baAoIggbFuXN/pXDema3dtJjVq+ZCs+jfXTBnkJ/I8baJ/Dr",
  render_errors: [view: FormChangesetExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FormChangesetExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
