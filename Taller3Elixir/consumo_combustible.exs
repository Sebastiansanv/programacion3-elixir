defmodule ConsumoCombustible do
  def main do
    # Pedir datos al usuario
    nombre = Util.input("Ingrese el nombre del conductor:", :string)
    distancia = Util.input("Ingrese la distancia recorrida en km:", :float)
    litros = Util.input("Ingrese la cantidad de combustible consumido en litros:", :float)

    # Calcular rendimiento
    rendimiento = distancia / litros

    # Mostrar resultados
    mensaje = """
    Conductor: #{nombre}
    Distancia recorrida: #{Float.round(distancia, 2)} km
    Combustible consumido: #{Float.round(litros, 2)} L
    Rendimiento: #{Float.round(rendimiento, 2)} km/L
    """

    Util.show_message(mensaje)
  end
end

# Ejecutar directamente al correr el archivo
ConsumoCombustible.main()
