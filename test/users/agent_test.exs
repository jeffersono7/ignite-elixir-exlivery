defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case, async: true

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    test "when the user is found, returns the user" do
      UserAgent.start_link(%{})

      :user
      |> build(cpf: "78901237891")
      |> UserAgent.save()

      response = UserAgent.get("78901237891")

      expected_response =
        {:ok,
         %User{
           address: "Brasilia",
           age: 25,
           cpf: "78901237891",
           email: "jefferson@teste.com",
           name: "jefferson"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      UserAgent.start_link(%{})

      response = UserAgent.get("000000000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
