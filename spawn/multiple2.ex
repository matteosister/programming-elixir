defmodule Multiple2 do
	def say_something do
		receive do
			{sender, msg} ->
				send sender, {:ok, msg}
				say_something
		end
	end
end

pid = spawn(Multiple2, :say_something, [])
pid2 = spawn(Multiple2, :say_something, [])

send pid, {self, "lucy"}
send pid2, {self, "matteo"}

receive do
	{:ok, msg} ->
		IO.puts msg
end
receive do
	{:ok, msg} ->
		IO.puts msg
end