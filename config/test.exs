import Config

config :logger, level: :warning
config :ash, disable_async?: true

config :calculationsbugrepro, Calculationsbugrepro.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "calculationsbugrepro_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
