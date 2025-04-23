defmodule App.Product do
  use Ash.Resource, otp_app: :calculationsbugrepro, domain: App, data_layer: AshPostgres.DataLayer

  postgres do
    table "products"
    repo Calculationsbugrepro.Repo
  end

  actions do
    defaults [:read, :destroy, update: [:name, :price], create: [:name, :price]]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :price, :integer do
      allow_nil? false
      public? true
    end

    timestamps()
  end
end
