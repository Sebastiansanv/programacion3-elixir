defmodule Finanzas do
  # Suma recursiva de elementos de la lista
  def suma([]), do: 0
  def suma([head | tail]), do: head + suma(tail)

  def main do
    # Pedir ingresos
    ingresos_str = Util.input("Ingrese los ingresos separados por comas (ej: 1000,200,500):", :string)
    ingresos =
      ingresos_str
      |> String.split(",", trim: true)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)

    total_ingresos = suma(ingresos)

    # Pedir gastos
    gastos_str = Util.input("Ingrese los gastos separados por comas (ej: 300,150):", :string)
    gastos =
      gastos_str
      |> String.split(",", trim: true)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)

    total_gastos = suma(gastos)

    # Calcular balance
    balance = total_ingresos - total_gastos

    mensaje = """
    Total Ingresos: $#{total_ingresos}
    Total Gastos: $#{total_gastos}
    Balance Final: $#{balance}
    """

    Util.show_message(mensaje)
  end
end

Finanzas.main()
