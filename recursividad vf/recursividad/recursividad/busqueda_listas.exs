defmodule Busqueda do
  import Util


  # Función recursiva de búsqueda

  def buscar(_, []), do: false
  def buscar(elem, [head | _tail]) when elem == head, do: true
  def buscar(elem, [_head | tail]), do: buscar(elem, tail)


  # Flujo principal con entrada/salida

  def main do
        # Pedir la lista (separada por comas)
    lista_str = input("Ingrese la lista de elementos separados por comas:", :string)

    # Pedir el elemento a buscar
    elem = input("Ingrese el elemento a buscar (texto):", :string)

    # Convertir a lista de strings
    lista = String.split(lista_str, ",") |> Enum.map(&String.trim/1)

    # Buscar
    resultado = buscar(elem, lista)

    if resultado do
      show_message("El elemento \"#{elem}\" SÍ está en la lista.")
    else
      show_message("El elemento \"#{elem}\" NO está en la lista.")
    end
  end
end

Busqueda.main()
