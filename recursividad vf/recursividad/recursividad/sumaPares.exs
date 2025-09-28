defmodule SumaPares do
  def main do
    # Pedimos la lista como texto separado por comas
    entrada = Util.input("Ingrese números separados por comas:", :string)

    lista =
      entrada
      |> String.split(",")         # ["2","3","4"]
      |> Enum.map(&String.trim/1)  # ["2","3","4"] (limpia espacios)
      |> Enum.map(&String.to_integer/1) # [2,3,4]

    resultado = suma_pares(lista)

    Util.show_message("La suma de los números pares es: #{resultado}")
  end

  # Caso base
  def suma_pares([]), do: 0

  # Caso recursivo
  def suma_pares([h | t]) do
    if rem(h, 2) == 0 do
      h + suma_pares(t)
    else
      suma_pares(t)
    end
  end
end
SumaPares.main()
