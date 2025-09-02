defmodule InventarioLibreria do
  def main do
    # Pedir datos al usuario
    titulo = Util.input("Ingrese el título del libro:", :string)
    cantidad = Util.input("Ingrese la cantidad de unidades disponibles:", :integer)
    precio = Util.input("Ingrese el precio unitario:", :float)

    # Calcular valor total
    valor_total = cantidad * precio

    # Formatear con separadores de miles
    valor_formateado = :erlang.float_to_binary(valor_total, decimals: 2)
    |> String.replace(~r/(\d)(?=(\d{3})+(\.|$))/, "\\1,")

    # Mostrar resultados
    mensaje = """
    El libro "#{titulo}" tiene #{cantidad} unidades,
    con un valor total de $#{valor_formateado}.
    """

    Util.show_message(mensaje)
  end
end

# Ejecutar directamente
InventarioLibreria.main()
