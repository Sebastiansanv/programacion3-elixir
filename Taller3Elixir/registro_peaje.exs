defmodule RegistroPeaje do
  def main do
    # Pedir datos
    placa = Util.input("Ingrese la placa del vehículo:", :string)
    tipo = Util.input("Ingrese el tipo de vehículo (Carro, Moto, Camión):", :string)
    peso = Util.input("Ingrese el peso del vehículo en toneladas:", :float)

    # Calcular tarifa según tipo de vehículo, debe escribir el tipo de vehiculo tal cual esta abajo
    tarifa =
      case String.downcase(tipo) do
        "carro" -> 10_000
        "moto" -> 5_000
        "camion" ->
          20_000 + round(peso * 2_000)
        _ -> 0
      end

    # Formatear tarifa con separador de miles
    tarifa_formateada =
      Integer.to_string(tarifa)
      |> String.replace(~r/(\d)(?=(\d{3})+$)/, "\\1,")

    # Mostrar mensaje
    mensaje = """
    Vehículo #{placa} (#{tipo}) debe pagar $#{tarifa_formateada}.
    """

    Util.show_message(mensaje)

    # Retornar tupla como indica el enunciado
    {placa, tipo, tarifa}
  end
end

# Ejecutar directamente
RegistroPeaje.main()
