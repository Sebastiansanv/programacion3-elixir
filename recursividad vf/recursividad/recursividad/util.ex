defmodule Util do
  # Mostrar mensaje (sin retorno)
  def show_message(message) do
    System.cmd("java", ["Mensaje", message])
    :ok
  end

  def input(message, type) when type == :string do
    {output, 0} = System.cmd("java", ["Mensaje", "input", message])
    String.trim(output)
  end

  def input(message, type) when type == :integer do
    input(message, :string)
    |> String.to_integer()
  end

  def input(message, type) when type == :float do
    input(message, :string)
    |> String.to_float()
  end
end
