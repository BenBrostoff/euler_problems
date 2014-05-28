def squares_nat(num)
	array = (1.. num).to_a
	array.map!{|a| a**2}
	sum = 0
	array.each {|i| sum += i}
	return sum
end

squares_nat(10)

def square_sum_nat(num)
	array = (1.. num).to_a
	sum = 0
	array.each {|i| sum += i}
	sum ** 2
end

square_sum_nat(10)

square_sum_nat(100) - squares_nat(100) 