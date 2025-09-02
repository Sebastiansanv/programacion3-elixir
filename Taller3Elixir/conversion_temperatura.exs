defmodule ConversionTemperatura do
  def main do
    # Pedir datos
    nombre = Util.input("Ingrese su nombre:", :string)
    celsius = Util.input("Ingrese la temperatura en °C:", :float)

    # Fórmulas de conversión
    fahrenheit = (celsius * 9 / 5) + 32
    kelvin = celsius + 273.15

    # Mostrar resultados con 1 decimal
    mensaje = """
    #{nombre}, la temperatura es:
    - #{Float.round(fahrenheit, 1)} °F
    - #{Float.round(kelvin, 1)} K
    """

    Util.show_message(mensaje)
  end
end

# Ejecutar directamente
ConversionTemperatura.main()
