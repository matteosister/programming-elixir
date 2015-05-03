defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _pid_from, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({ :push, what }, list) do
    { :noreply, [what] ++ list }
  end
end
