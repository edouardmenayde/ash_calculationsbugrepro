defmodule Calculationsbugrepro.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [Calculationsbugrepro.Repo]

    opts = [strategy: :one_for_one, name: Calculationsbugrepro.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
