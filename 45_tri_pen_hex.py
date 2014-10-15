import math
  
def refactor_solve(x):
  solve = 0.1
  while solve % 1 != 0:
    # knowing that (3y^2 - y)/2 = 2x^2 - x
    solve = (math.sqrt(48 * (x ** 2) - 24 * x + 1) + 1) / 6
    x += 1
  return pen(solve)
    
def hex(x):
  return x * (2 * x - 1)

def pen(x):
  return (x * (3 * x - 1)) / 2

def intersection(a, b):
  return set(a).intersection(b)

def test(x):
  if len(x) < 1:
    return False
  else:
    return True

def mass_append(a, b, el_a, el_b):
  a.append(el_a)
  b.append(el_b)

def solve(x):
  counter = x
  check, hex_hold, pen_hold = False, [], []
  while check == False:
    mass_append(hex_hold, pen_hold,
                hex(counter), pen(counter))
    if test(intersection(hex_hold, pen_hold)):
      return intersection(hex_hold, pen_hold).pop()
    counter += 1

# By finding relationship between hex and pen
print refactor_solve(166)
# Brute force intersection
# print solve(166)



