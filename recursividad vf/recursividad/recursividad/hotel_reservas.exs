defmodule Reservas do
  import Util

  # ----------------------------
  # Función recursiva
  # ----------------------------
  def total_dias([]), do: 0
  def total_dias([%{dias: d} | tail]), do: d + total_dias(tail)

  # ----------------------------
  # Flujo principal
  # ----------------------------
  def main do
    # Pedir cuántas reservas quiere registrar
    n = input("¿Cuántas reservas desea ingresar?", :integer)

    # Construir la lista de reservas recursivamente
    reservas = pedir_reservas(n, [])

    # Calcular total de días
    total = total_dias(reservas)

    # Mostrar resultado
    show_message("El total de días reservados es: #{total}")
  end

  # ----------------------------
  # Función recursiva para pedir reservas
  # ----------------------------
  defp pedir_reservas(0, acc), do: Enum.reverse(acc)

  defp pedir_reservas(n, acc) do
    cliente = input("Ingrese el nombre del cliente:", :string)
    dias = input("Ingrese los días reservados:", :integer)

    reserva = %{cliente: cliente, dias: dias}
    pedir_reservas(n - 1, [reserva | acc])
  end
end
Reservas.main()
