defmodule Strings do
  def all_ascii?([]), do: true
  def all_ascii?([c | tail]) do
    c >= ?\s and c <= ?~ and all_ascii?(tail)
  end
  defp lists_equals([], []), do: true
  defp lists_equals([h1 | t1], [h2 | t2]) do
    h1 == h2 and lists_equals(t1, t2)
  end
  def anagram(word1, word2) when length(word1) != length(word2), do: false
  def anagram(word1, word2) do
    lists_equals(Enum.sort(word1), Enum.sort(word2))
  end
  def calculate([], previous_value), do: previous_value
  def calculate([c | tail], previous_value) when c == ?+ do
    previous_value + calculate(tail, 0)
  end
  def calculate([c | tail], previous_value) when c == ?- do
    previous_value - calculate(tail, 0)
  end
  def calculate([c | tail], previous_value) when c == ?* do
    previous_value * calculate(tail, 0)
  end
  def calculate([c | tail], previous_value) when c == ?/ do
    previous_value / calculate(tail, 0)
  end
  def calculate([c | tail], previous_value) do
    calculate(tail, (previous_value * 10) + (c - ?0))
  end
end

defmodule EnumTest do
  def filter([], _) do
    []
  end
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end
  def all?([], _) do
    true
  end
  def all?([head | tail], func) do
    func.(head) and all?(tail, func)
  end
  def take([], _) do
    []
  end
  def take(list, count) when length(list) < count do
    list
  end
  defp take_count(_list, curr, count) when curr > count do
    []
  end
  defp take_count([head | tail], curr, count) when curr <= count do
    [head | take_count(tail, curr + 1, count)]
  end
  def take(list, count) do
    take_count(list, 1, count)
  end
end

defmodule Flatten do
  def flat([]) do
    []
  end
  def flat([head | tail]) when not is_list(head) do
    [head | flat(tail)]
  end
  def flat([head | tail]) when is_list(head) do
    flat(head) ++ flat(tail)
  end
end

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.0],
  [ id: 456, ship_to: :TX, net_amount: 50.0],
  [ id: 10, ship_to: :PA, net_amount: 34.0]
]

defmodule Test do
  def calculate(orders, sales_tax) do
    for order <- orders do
      net_amount = Keyword.get(order, :net_amount)
      ship_to = Keyword.get(order, :ship_to)
      sales_tax = Keyword.get(sales_tax, ship_to, 0)
      Keyword.put_new(order, :total_amount, net_amount + (net_amount * sales_tax))
    end
  end
end
