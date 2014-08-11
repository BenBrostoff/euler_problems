def factors(n):    
    return set(reduce(list.__add__, 
                ([i, n//i] for i in range(1, int(n**0.5) + 1) if n % i == 0)))

def tri_sequence():
  x, counter = 1, 1
  while len(factors(x)) < 500:
      counter += 1
      x += counter
  return x 

print tri_sequence()
