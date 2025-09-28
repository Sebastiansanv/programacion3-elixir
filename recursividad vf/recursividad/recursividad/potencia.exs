defmodule Potencia do
  def main do
    base = Util.input("Ingrese la base:", :integer)
    exponente = Util.input("Ingrese el exponente:", :integer)

    resultado = potencia(base, exponente)

    Util.show_message("El resultado de #{base} ^ #{exponente} es: #{resultado}")
  end

  # Caso base
  def potencia(_base, 0), do: 1

  # Caso recursivo (exponente positivo)
  def potencia(base, exponente) when exponente > 0 do
    base * potencia(base, exponente - 1)
  end

  # Opcional: manejar exponentes negativos
  def potencia(base, exponente) when exponente < 0 do
    1 / potencia(base, -exponente)
  end
end
Potencia.main()
