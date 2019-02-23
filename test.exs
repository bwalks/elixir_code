defmodule Test do
  def sum([]), do: 0
  def sum([head | tail]) do
    head + sum(tail)
  end

  def mapsum([value], func), do: func.(value)
  def mapsum([head | tail], func) do
    func.(head) + mapsum(tail, func)
  end

  defp compare(a, b) when a < b do
    b
  end
  defp compare(a, b) when a >= b do
    a
  end
  def max([head]), do: head
  def max([head | tail]) do
    compare(head, max(tail))
  end
  
  defp _cipher([], _) do
    []
  end

  defp _cipher([head | tail], offset) do
    [Integer.mod(?head + offset, ?z)  | _cipher(tail, offset)]
  end

  def cipher(string, offset) do
    string
      |> String.codepoints
      |> _cipher(offset)
      |> List.to_string
  end 
end
