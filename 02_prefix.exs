prefix = fn first ->
  fn second ->
    "#{first} #{second}"
  end
end

name = prefix.("matteo")
IO.puts name.("giachino")

