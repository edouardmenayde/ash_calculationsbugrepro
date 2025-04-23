defmodule App.CartItem do
  use Ash.Resource, otp_app: :calculationsbugrepro, domain: App, data_layer: AshPostgres.DataLayer

  postgres do
    table "cart_items"
    repo Calculationsbugrepro.Repo
  end

  actions do
    defaults [:read, :destroy, update: [:quantity], create: [:quantity]]

    create :_create do
      accept [
        :quantity
      ]

      argument :product, :map
      argument :cart, :map

      change manage_relationship(:product, type: :create)
      change manage_relationship(:cart, type: :create)
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :quantity, :integer do
      allow_nil? false
      public? true
    end

    timestamps()
  end

  relationships do
    belongs_to :product, App.Product
    belongs_to :cart, App.Cart
  end

  calculations do
    calculate :price, :integer, App.CalculatePrice
  end
end
