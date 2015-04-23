defmodule MyString do
  def is_printable_ascii([ digit | tail ]) do
    digit in ?\s..?~ && is_printable_ascii(tail)
  end
  def is_printable_ascii([]), do: true

  def anagram?(word1, word2), do: word1 == Enum.reverse word2

  def number(str), do: _number_digits(str, 0)
  defp _number_digits([], total), do: total
  defp _number_digits([digit | tail], total) when digit in '0123456789' do
    _number_digits(tail, total*10 + digit - ?0)
  end
  defp _number_digits([non_digit | _ ], _) do
    raise "Invalid digit #{[non_digit]}"
  end
end
