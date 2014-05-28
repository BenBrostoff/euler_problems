def factor_count(num)
	j = 0 
	for i in (1..num) do
		j += 1 if num % i == 0 
	end
	return j
end

def prime_array(bound)
	array = (1..bound).to_a
	array.find_all{|i| factor_count(i) == 2}
end

def largest_prime_factor(num)
	new_num = 0
	divide_array = prime_array(10000) 
	divide_array.each do |i|
		num /= i if num % i == 0 && num != i
	end
	return num
end

largest_prime_factor(600851475143)

# Note - I don't particularly like this solution as it's a bit of brute force.
# Essentially, we're using prime factorization with all primes below 10,000
