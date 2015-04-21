defmodule MyEnum do
  # ALL?
  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end
  def all?([], _), do: true

  # EACH
  def each([head | tail], func) do 
    func.(head)
    each(tail, func)
  end
  def each([], _), do: :ok

  # FILTER
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end
  def filter([], _), do: []

  # SPLIT, do not takes negative values
  def split(list, splitAt), do: _split(list, splitAt, [])
  defp _split([head | tail], splitAt, acc) when length(acc) < splitAt, do: _split(tail, splitAt, acc ++ [head])
  defp _split(list, splitAt, acc) when length(acc) == splitAt, do: {acc, list}
  defp _split([], _, acc), do: {acc, []}

  # TAKE, no negative values
  def take([], _), do: []
  def take(_, 0), do: []
  def take(list, at) when length(list) < at, do: list
  def take(list, at), do: _take(list, at, [])
  def _take([head | tail], at, acc) when length(acc) < at, do: _take(tail, at, acc ++ [head])
  def _take(_, _, acc), do: acc
end
