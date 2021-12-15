defmodule Exlivery.Users.UserTest do
  use ExUnit.Case, async: true

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Jefferson", "jefferson@email.com", "123123001", 25, "Brasilia")

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Brasilia",
           age: 25,
           cpf: "123123001",
           email: "jefferson@email.com",
           name: "Jefferson"
         }}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build("Jefferson Junior", "jefferson@email.com", "123123001", 15, "Brasilia")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
