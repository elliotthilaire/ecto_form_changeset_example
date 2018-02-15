use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :form_changeset_example, FormChangesetExampleWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :form_changeset_example, FormChangesetExample.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "form_changeset_example_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox