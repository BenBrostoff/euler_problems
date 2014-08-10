def even_fib_sequence_sum(value):
  fib, i = [1,1], 0
  while fib[-1] <= value:
    fib += [fib[-1] + fib[-2]]
    i += 1
  return sum([x for x in fib if x % 2 == 0])

print even_fib_sequence_sum(4000000)