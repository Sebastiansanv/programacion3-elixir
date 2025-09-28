defmodule Factorial do
  def calcular(0), do: 1
  def calcular(n) when n < 0, do: {:error, "No se puede calcular el factorial de un número negativo"}
  def calcular(n) when is_integer(n) and n > 0, do: n * calcular(n - 1)

  def main do
    numero = Util.input("Ingrese un número entero:", :integer)

    resultado =
      case calcular(numero) do
        {:error, msg} ->
          msg
        valor ->
          "El factorial de #{numero} es: #{valor}"
      end

    Util.show_message(resultado)
  end
end

Factorial.main()
