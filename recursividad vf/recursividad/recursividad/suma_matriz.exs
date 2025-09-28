defmodule SumaMatriz do
  def main do
    entrada = Util.input("Ingrese la matriz como filas separadas por ';' y números por comas\nEjemplo: 1,2,3; 4,5; 6", :string)

    matriz =
      entrada
      |> String.split(";") # ["1,2,3", " 4,5", " 6"]
      |> Enum.map(fn fila ->
        fila
        |> String.split(",")
        |> Enum.map(&String.trim/1)
        |> Enum.map(&String.to_integer/1)
      end)

    resultado = suma_matriz(matriz)

    Util.show_message("La suma de los elementos de la matriz es: #{resultado}")
  end

  # Caso base: matriz vacía
  def suma_matriz([]), do: 0

  # Caso recursivo: sumar fila + resto
  def suma_matriz([fila | resto]) do
    suma_fila(fila) + suma_matriz(resto)
  end

  # Sumar los elementos de una fila
  def suma_fila([]), do: 0
  def suma_fila([h | t]), do: h + suma_fila(t)
end
SumaMatriz.main()
