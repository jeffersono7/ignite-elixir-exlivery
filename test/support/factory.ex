defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "jefferson",
      email: "jefferson@teste.com",
      cpf: "12332112392",
      age: 25,
      address: "Brasilia"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Brasilia",
      items: [
        build(:item),
        build(:item,
          category: :japonesa,
          description: "Temaki de atum",
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "12332112392"
    }
  end
end
