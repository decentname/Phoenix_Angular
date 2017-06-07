use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :phoenix_angular, PhoenixAngular.Endpoint,
  secret_key_base: "U85TelEqcSutnyx+d+SDkMQPp6pC7tw9WiuN0X/ThnSD0psVJpWT3DVQ3FZOiSvp"

# Configure your database
config :phoenix_angular, PhoenixAngular.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "phoenix_angular_prod",
  pool_size: 20
