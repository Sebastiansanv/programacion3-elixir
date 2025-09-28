defmodule Pedidos do
  def main do
    entrada = Util.input("Ingrese pedidos en formato producto:cantidad separados por comas\nEjemplo: manzana:5, pera:3, banana:7", :string)

    pedidos =
      entrada
      |> String.split(",") # ["manzana:5", " pera:3", " banano:7"]
      |> Enum.map(&String.trim/1)
      |> Enum.map(fn item ->
        [producto, cantidad] = String.split(item, ":")
        %{producto: String.trim(producto), cantidad: String.to_integer(String.trim(cantidad))}
      end)

    total = total_pedidos(pedidos)

    Util.show_message("La cantidad total de productos pedidos es: #{total}")
  end

  # Caso base
  def total_pedidos([]), do: 0

  # Caso recursivo
  def total_pedidos([%{cantidad: c} | t]) do
    c + total_pedidos(t)
  end
end
Pedidos.main()
