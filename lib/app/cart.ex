defmodule App.Cart do
  use Ash.Resource, otp_app: :calculationsbugrepro, domain: App, data_layer: AshPostgres.DataLayer

  postgres do
    table "carts"
    repo Calculationsbugrepro.Repo
  end

  actions do
    defaults [:read, :destroy, update: [], create: []]
  end

  attributes do
    uuid_primary_key :id

    timestamps()
  end

  relationships do
    has_many :items, App.CartItem
  end

  calculations do
    calculate :total, :integer, App.Total
    calculate :suffixes, {:array, :string}, App.Suffix
  end
end
