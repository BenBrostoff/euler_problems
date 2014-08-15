def collatz(num):
  sequence = [num]
  while num != 1:
    if num % 2 != 0:
      num = num * 3 + 1
      sequence.append(num)
    else:
      num = num / 2
      sequence.append(num)
  return sequence

def long_seq():
  long_collatz = []
  actual = []
  for num in range(1, 1000001):
    actual.append(num)
    long_collatz.append(len(collatz(num)))
  final = long_collatz.index(max(long_collatz))
  return actual[final]

 
print long_seq()