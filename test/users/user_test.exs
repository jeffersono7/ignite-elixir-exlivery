defmodule Exlivery.Users.UserTest do
  use ExUnit.Case, async: true

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("jefferson", "jefferson@teste.com", "12332112392", 25, "Brasilia")

      expected_response = {:ok, build(:user)}

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
