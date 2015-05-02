defmodule Ticker do

  @interval 2000
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], 0])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients, num) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        generator([pid|clients], num)
    after
      @interval ->
        IO.puts "tick"
        unless length(clients) > 0, do: generator(clients, num)
        client = Enum.at clients, num
        send client, { :tick }
        generator(clients, next_number(clients, num))
    end
  end

  defp next_number(clients, actual_number) when length(clients) == actual_number + 1, do: 0
  defp next_number(_, actual_number), do: actual_number + 1
end

defmodule Client do
  
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register pid
  end

  def receiver do
    receive do
      { :tick } ->
        IO.puts "tock from client"
        receiver
    end
  end
end
