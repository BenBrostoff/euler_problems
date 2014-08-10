# I used this problem to study the Sieve of Eratosthenes
# This code is largely from http://rosettacode.org/wiki/Sieve_of_Eratosthenes#Ruby
# Assume example 10 below

def eratosthenes(n)
  nums = [nil, nil, *2..n] # begin with initial array
  (2..Math.sqrt(n)).each do |i|  # iterate from 2 to 3 (sqrt(10) round down)
    (i**2..n).step(i) {|m| nums[m] = nil}  if nums[i] # step up by iterateor
    end
    # ex 2,4,6,8, then 3,6,9
    # set element in array to nil if step touches it
nums.compact # strip out nils, end up with primes
end
 
def prime_count(n)
	i = 1
	while eratosthenes(i).length != n 
	  i += 1
	end
	return eratosthenes(i).last
end



prime_count(1000) #7,919