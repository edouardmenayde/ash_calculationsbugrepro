defmodule App.CalculatePrice do
  use Ash.Resource.Calculation

  @impl true
  def load(_query, _opts, _context) do
    [:quantity, product: [:price]]
  end

  @impl true
  def calculate(records, _opts, _context) do
    Enum.map(records, fn record ->
      record.quantity * record.product.price
    end)
  end
end
