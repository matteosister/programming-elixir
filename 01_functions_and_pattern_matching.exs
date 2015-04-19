test_pattern_match = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

IO.puts test_pattern_match.(0, 0, "a")
IO.puts test_pattern_match.(0, "a", "a")
IO.puts test_pattern_match.("a", 0, "a")
IO.puts test_pattern_match.("a", "a", "a")

test_rem = fn n ->
  test_pattern_match.(rem(n,3), rem(n,5), n)
end

IO.puts test_rem.(10)
IO.puts test_rem.(11)
IO.puts test_rem.(12)
IO.puts test_rem.(13)
IO.puts test_rem.(14)
IO.puts test_rem.(15)
IO.puts test_rem.(16)
