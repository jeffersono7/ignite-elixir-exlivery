defmodule Exlivery.Orders.Order do
  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  @keys [:user_cpf, :delivery_address, :items, :total_price]

  @enforce_keys @keys

  defstruct @keys

  def build(%User{cpf: cpf, address: address}, [%Item{} | _items] = items) do
    {:ok,
     %__MODULE__{
       user_cpf: cpf,
       delivery_address: address,
       items: items,
       total_price: calculate_total_price(items)
     }}
  end

  def build(_user, _items), do: {:error, "Invalid parameters"}

  defp calculate_total_price(items) do
    for item <- items, reduce: Decimal.new(0) do
      acc -> sum_prices(item, acc)
    end
  end

  defp sum_prices(%Item{unity_price: unity_price, quantity: quantity}, acc) do
    unity_price
    |> Decimal.mult(quantity)
    |> Decimal.add(acc)
  end
end
