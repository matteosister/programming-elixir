defmodule MyList do
  def sum(list), do: _sum(list, 0)

  defp _sum([], total),           do: total
  defp _sum([head | tail], total), do: _sum(tail, head+total)

  def sum2([]),            do: 0
  def sum2([head | tail]), do: head + sum2(tail)

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max(list), do: _max(list, 0)

  defp _max([], the_max),                                 do: the_max
  defp _max([head | tail], the_max) when head >= the_max, do: _max(tail, head)
  defp _max([head | tail], the_max) when head < the_max,  do: _max(tail, the_max)

  def caesar([], _), do: []
  def caesar([head | tail], n) when head + n <= ?z, do: [head + n] ++ caesar(tail, n)
  def caesar([head | tail], n), do: [?` + (n - (?z - head))] ++ caesar(tail, n)

  def span(from,to) when from == to, do: [to]
  def span(from,to),                 do: [from | span(from + 1, to)]

  def primes(to), do: (for x <- span(2, to), is_prime?(x), do: x)

  def is_prime?(n) do
    divisors = Enum.filter(2..n-1, &(rem(n, &1) == 0))
    length(divisors) == 0
  end

  def orders_with_shipment(tax_rates, orders) do
    for o <- orders, 
      Enum.member?([:NC, :TX], o[:ship_to]),
      do: o ++ [total_amount: o[:net_amount] + (o[:net_amount] * tax_rates[o[:ship_to]])]
  end
end
