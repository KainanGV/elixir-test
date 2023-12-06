defmodule ProjectWeb.EchoController do
  use ProjectWeb, :controller

  def create(conn, %{"data" => data}) do
    json(conn, %{message: "Received and returned data", data: data})
  end

  def create(conn, _params) do
    json(conn, %{error: "Invalid request parameters"})
  end
end
