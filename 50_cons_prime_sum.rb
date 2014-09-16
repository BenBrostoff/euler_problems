require_relative '7_10001_prime.rb'

def sum_array(array)
  final, sum = [], 0
  array.each do |num|
    sum += num
    final << sum 
  end
  return final
end


def find(bound)
  primes, sol, max = eratosthenes(bound), [0,0], 0
  sum_primes = sum_array(primes)
  sum_primes.reverse.each_with_index do |sum_a, index_a|
    sum_primes.each_with_index do |sum_b, index_b|
      break if sum_a - sum_b > bound || sum_primes.length - index_b - index_a < max
      if primes.include?(sum_a - sum_b)
        sol << [sum_a - sum_b, sum_primes.length - index_b - index_a] 
      end
      max = sol.sort_by{ |x| x[1] }[-1][1]
    end
  end
  return sol.sort_by{ |x| x[1] }[-1][0]
end

p find(1_000_000)
