App.CartItem
|> Ash.Changeset.for_create(:_create, %{
  quantity: 2,
  product: %{
    name: "Fès",
    price: 7
  },
  cart: %{}
})
|> Ash.create()


App.Cart |> Ash.Query.for_read(:read) |> Ash.read!(load: [:suffixes, :total])
