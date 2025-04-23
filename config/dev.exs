import Config

config :calculationsbugrepro, Calculationsbugrepro.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "calculationsbugrepro_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
