defmodule App.Suffix do
  use Ash.Resource.Calculation

  @impl true
  def load(_query, _opts, _context) do
    [items: [:price, product: [:name]]]
  end

  @impl true
  def calculate(records, _opts, _context) do
    Enum.map(records, fn record ->
      Enum.map(record.items, fn item ->
        dbg(item.product)
        item.product.name <> " - " <> Integer.to_string(item.price)
      end)
    end)
  end
end
