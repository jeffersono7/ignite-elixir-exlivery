defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "create the report file" do
      Exlivery.start_agents()

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected_response =
        "12332112392,pizza,1,35.5,japonesa,2,20.50,76.50\n" <>
          "12332112392,pizza,1,35.5,japonesa,2,20.50,76.50\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
