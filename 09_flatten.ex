defmodule MyList do
  def flatten(list), do: _flatten(list, [])
  defp _flatten([head | tail], acc) when is_list(head), do: _flatten(head, acc) ++ _flatten(tail, [])
  defp _flatten([head | tail], acc), do: _flatten(tail, acc ++ [head])
  defp _flatten([], acc), do: acc
end
