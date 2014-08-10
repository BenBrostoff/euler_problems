def multiples_under(num)
	array = (1... num).to_a
	new_array = array.find_all{|i| i % 3 == 0 || i % 5 == 0}
end

def sum_multiples(num)
	array = multiples_under(num)
	sum = 0
	array.each{|i| sum += i}
	return sum
end

puts sum_multiples(1000)