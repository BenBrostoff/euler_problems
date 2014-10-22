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
  for num in xrange(1, 1000001):
    long_collatz.append([num, len(collatz(num))])
  max_index = long_collatz.index(max(long_collatz, key=lambda x: x[1]))
  return long_collatz[max_index][0]

print long_seq()