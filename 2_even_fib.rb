def fib_sequence(value)
  fib, i = [1,1], 0
  while fib.last <= value
    fib << fib[i] + fib[i+1]
    i += 1
  end
  return fib
end

def even_fib_sum(value)
  even_fib = fib_sequence(value).find_all{|i| i % 2 == 0}
  even_fib.inject{ |sum, x| sum + x }
end

print even_fib_sum(4_000_000)
