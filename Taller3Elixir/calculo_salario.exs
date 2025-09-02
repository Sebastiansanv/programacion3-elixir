defmodule CalculoSalario do
  def main do
    # Pedir datos
    nombre = Util.input("Ingrese el nombre del empleado:", :string)
    salario_base = Util.input("Ingrese el salario base:", :integer)
    horas_extras = Util.input("Ingrese las horas extras trabajadas:", :integer)

    # Calcular valor de una hora normal
    # Suponiendo jornada estándar de 160 horas/mes (40 horas semanales)
    valor_hora = salario_base / 160

    # Pago de horas extras (1.5x)
    pago_extras = horas_extras * valor_hora * 1.5

    # Salario total
    salario_total = salario_base + pago_extras

    # Formatear con separadores de miles
    salario_formateado =
      :erlang.float_to_binary(salario_total, decimals: 2)
      |> String.replace(~r/(\d)(?=(\d{3})+(\.|$))/, "\\1,")

    # Mostrar resultados
    mensaje = """
    El salario total de #{nombre} es de $#{salario_formateado}.
    """

    Util.show_message(mensaje)
  end
end

# Ejecutar directamente
CalculoSalario.main()
