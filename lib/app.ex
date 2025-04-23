defmodule App do
  use Ash.Domain,
    otp_app: :calculationsbugrepro

  resources do
    resource App.Product
    resource App.Cart
    resource App.CartItem
  end
end
