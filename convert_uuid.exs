defmodule ConvertUUID do
  # Converts UUID bytes in little-endian format
  defp get_reverse(list, range) do
    list |> Enum.slice(range) |> Enum.reverse
  end
  def from_binary_le(id) do
    arr = String.codepoints(id)
    Enum.concat(
      [
        get_reverse(arr, 0..3),
        get_reverse(arr, 4..5),
        get_reverse(arr, 6..7),
        Enum.slice(arr, 8..15)
      ]
    ) |> Enum.join |> UUID.binary_to_string!
  end
end

id = "\xe9\x1b\xbbt\xcdr\x19F\x8bRk\xce\xda\x06C\x92"
ConvertUUID.from_binary_le(id)


first = arr |> Enum.slice(0..3) |> Enum.reverse
second = arr |> Enum.slice(4..5) |> Enum.reverse
third = arr |> Enum.slice(6..7) |> Enum.reverse
last = Enum.slice(arr, 8..15)
Enum.concat([first, second, third, last]) |> Enum.join |> UUID.binary_to_string!
