defmodule ProjectWeb.EchoIntegrationTest do
  use ProjectWeb.ConnCase
  use HTTPoison.Base

  @endpoint "/api/echo"

  test "POST #{@endpoint} with valid data", %{conn: conn} do
    data = %{"data" => %{"key" => "value"}}
    response =
      post(conn, @endpoint, Poison.encode!(data), %{"Content-Type" => "application/json"})

    assert response.status_code == 200
    assert Poison.decode!(response.body) == %{"message" => "Received and returned data", "data" => %{"key" => "value"}}
  end

  test "POST #{@endpoint} with invalid data", %{conn: conn} do
    invalid_data = %{"invalid_key" => "value"}
    response =
      post(conn, @endpoint, Poison.encode!(invalid_data), %{"Content-Type" => "application/json"})

    assert response.status_code == 200
    assert Poison.decode!(response.body) == %{"error" => "Invalid request parameters"}
  end
end
