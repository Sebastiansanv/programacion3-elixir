defmodule CostoEnvio do
  def main do
    # 1. Pedir datos
    cliente = Util.input("Ingrese el nombre del cliente:", :string)
    peso = Util.input("Ingrese el peso del paquete en kg:", :float)
    tipo_envio = Util.input("Ingrese el tipo de envío (Económico, Express, Internacional):", :string)

    # 2. Calcular costo según tipo
    costo_total =
      case String.downcase(tipo_envio) do
        "económico" ->
          5_000 * peso

        "express" ->
          8_000 * peso

        "internacional" ->
          # Aquí usamos if dentro del case
          if peso <= 5 do
            15_000 * peso
          else
            12_000 * peso
          end

        _ ->
          0
      end

    # 3. Otra validación extra con cond (por ejemplo para valores inválidos)
    cond do
      costo_total == 0 ->
        Util.show_message("Tipo de envío inválido ingresado.")
      true ->
        # Formatear resultado con separador de miles
        costo_formateado =
          round(costo_total)
          |> Integer.to_string()
          |> String.replace(~r/(\d)(?=(\d{3})+$)/, "\\1,")

        mensaje = """
        Cliente: #{cliente}
        Peso: #{Float.round(peso, 2)} kg
        Tipo de envío: #{tipo_envio}
        Costo total: $#{costo_formateado}
        """

        Util.show_message(mensaje)
    end

    # 4. Retornar tupla como pide el enunciado
    {cliente, peso, tipo_envio, round(costo_total)}
  end
end

# Ejecutar directamente
CostoEnvio.main()
