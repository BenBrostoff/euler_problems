def solver
array = [0,1]
i = 0
while array.last <= 4000000
fib = array.push(array[i] + array[i+1])
i += 1
end
fib.drop(2)
end

def evenFib
evenFib = solver.find_all{|i| i % 2 == 0}
sum = 0
evenFib.each{|i| sum += i}
return sum
end

evenFib