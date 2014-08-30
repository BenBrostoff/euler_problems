def power_up():
  lst = []
  for x in xrange(1001):
    lst.append(x ** x)
  sol = map(int, str(sum(lst)))
  return sol[len(sol) - 10:]

print power_up()