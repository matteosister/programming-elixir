defmodule Chop do
  def guess(actual, range) do
    do_guess actual, 500, range
  end

  def do_guess(real, checked, _) when real == checked do
    ask(checked)
    IO.puts checked
  end

  def do_guess(real, checked, _..max) when real > checked do
    ask(checked)
    do_guess real, checked + div(max-checked, 2), checked..max
  end

  def do_guess(real, checked, min.._) when real < checked do
     ask(checked)
     do_guess real, min + div(checked - min, 2), min..checked
  end

  def ask(n), do: IO.puts "Is it #{n}?"
end

