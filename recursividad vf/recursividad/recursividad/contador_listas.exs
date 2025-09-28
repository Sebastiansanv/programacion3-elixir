defmodule Contador do
  def contar([]), do: 0
  def contar([_ | tail]), do: 1 + contar(tail)

  def main do
    entrada = Util.input("Ingrese los elementos de la lista separados por comas:", :string)
    lista =
      entrada
      |> String.split(",", trim: true)
      |> Enum.map(&String.trim/1)

    cantidad = contar(lista)

    Util.show_message("La lista tiene #{cantidad} elementos.")
  end
end

Contador.main()
