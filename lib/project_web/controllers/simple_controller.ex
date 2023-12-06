defmodule ProjectWeb.SimpleController do
  use ProjectWeb, :controller

  def get(conn, _params) do
    json(conn, %{message: "Hello, this is a simple GET response"})
  end
end
