defmodule Permutaciones do
  def main do
    entrada = Util.input("Ingrese elementos separados por comas:", :string)

    lista =
      entrada
      |> String.split(",")
      |> Enum.map(&String.trim/1)

    resultado = permutar(lista)

    # Convertimos las permutaciones a string para mostrarlas bien
    mensaje =
      resultado
      |> Enum.map(&Enum.join(&1, ", "))
      |> Enum.join("\n")

    Util.show_message("Permutaciones generadas:\n\n#{mensaje}")
  end

  # Caso base
  def permutar([]), do: [[]]

  # Caso recursivo
  def permutar(lista) do
    for elem <- lista, resto <- permutar(lista -- [elem]) do
      [elem | resto]
    end
  end
end
Permutaciones.main()
