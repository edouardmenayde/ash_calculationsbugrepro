defmodule App.Total do
  use Ash.Resource.Calculation

  @impl true
  def load(_query, _opts, _context) do
    [items: [:price]]
  end

  @impl true
  def calculate(records, _opts, _context) do
    Enum.map(records, fn record ->
      Enum.map(record.items, fn item ->
        item.price
      end)
      |> Enum.sum()
    end)
  end
end
