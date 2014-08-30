def power_up():
  lst = []
  for x in xrange(1001):
    lst.append(x ** x)
  return map(int, str(sum(lst)))

print power_up()[len(power_up())-10:]