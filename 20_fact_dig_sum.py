def fact(n):
  if n == 0:
    return 1
  else:
    return n * fact(n - 1)

def fact_sum(n):
   r = 0
   while n:
       r, n = r + n % 10, n / 10
   return r

print fact_sum(fact(100))