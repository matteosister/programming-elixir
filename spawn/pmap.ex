defmodule Parallel do
	def pmap(collection, fun) do
		me = self
		collection
		|> Enum.map(fn (elem) ->
			   spawn_link fn ->
			   		wait_for = random_wait
			   		IO.inspect wait_for
			      :timer.sleep(wait_for)
			   	  send me, { self, fun.(elem) }
			   end
		   end)

		|> Enum.map(fn (pid) ->
			   receive do { ^pid, result } -> result end
		   end)
	end

	def random_wait do
		:random.seed(:erlang.now())
		:random.uniform(10) * 100
	end
end