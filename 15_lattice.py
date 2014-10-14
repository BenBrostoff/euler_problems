def fact(x):
  # use iteration for speed 
  hold, count = x, x
  while count > 1:
    count -= 1
    hold *= count
  return hold

def paths(x):
  # given x potential positions, choose for x/2 
  return fact(x) / (fact(x / 2) ** 2)

print paths(40)