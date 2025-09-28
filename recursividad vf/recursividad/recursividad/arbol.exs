defmodule Nodo do
  defstruct valor: nil, izq: nil, der: nil
end

defmodule RutasSuma do
  def main do
    objetivo = Util.input("Ingrese la suma objetivo:", :integer)

    # Ejemplo de árbol quemado en el código
    arbol = %Nodo{
      valor: 5,
      izq: %Nodo{
        valor: 4,
        izq: %Nodo{
          valor: 11,
          izq: %Nodo{valor: 7},
          der: %Nodo{valor: 2}
        }
      },
      der: %Nodo{
        valor: 8,
        izq: %Nodo{valor: 13},
        der: %Nodo{
          valor: 4,
          der: %Nodo{valor: 1}
        }
      }
    }

    rutas = rutas_objetivo(arbol, objetivo)

    if rutas == [] do
      Util.show_message("No existen rutas con suma = #{objetivo}")
    else
      mensaje =
        rutas
        |> Enum.map(&Enum.join(&1, " -> "))
        |> Enum.join("\n")

      Util.show_message("Rutas con suma #{objetivo}:\n\n#{mensaje}")
    end
  end

  # Caso base: árbol vacío
  def rutas_objetivo(nil, _objetivo), do: []

  # Caso base: nodo hoja
  def rutas_objetivo(%Nodo{valor: v, izq: nil, der: nil}, objetivo) do
    if v == objetivo, do: [[v]], else: []
  end

  # Caso recursivo: sumar caminos desde hijos
  def rutas_objetivo(%Nodo{valor: v, izq: izq, der: der}, objetivo) do
    nuevo_objetivo = objetivo - v

    izq_rutas =
      rutas_objetivo(izq, nuevo_objetivo)
      |> Enum.map(fn ruta -> [v | ruta] end)

    der_rutas =
      rutas_objetivo(der, nuevo_objetivo)
      |> Enum.map(fn ruta -> [v | ruta] end)

    izq_rutas ++ der_rutas
  end
end
RutasSuma.main()
