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

  def calculate(formula) do
    [_whole_match | [str_1, operation, str_2] ] = Regex.run ~r/(\d{0,})\s([+-\\*\/])\s(\d{0,})/, to_string formula
    num_1 = number to_char_list(str_1)
    num_2 = number to_char_list(str_2)

    _calculate(operation, num_1, num_2)
    #ops |> String.strip |> IO.puts
  end

  defp _calculate("+", num1, num2), do: num1 + num2
  defp _calculate("-", num1, num2), do: num1 - num2
  defp _calculate("/", num1, num2), do: num1 / num2
  defp _calculate("*", num1, num2), do: num1 * num2

  def center(words) do
    max_width = Enum.reduce words, 0, &(if String.length(&1) >= &2, do: String.length(&1), else: &2)
    padded_words = Enum.map words, &(_center_pad(&1, max_width))
    Enum.map padded_words, &IO.puts/1
  end

  defp _center_pad(str, size) do
    if String.length(str) == size do
      str
    else
      str_len = String.length(str)
      r_pad = div(size - str_len, 2)
      l_pad = size - str_len - r_par
      str |> String.rjust(str_len + r_pad) |> String.ljust(str_len + r_pad + l_pad)
    end
  end
end
