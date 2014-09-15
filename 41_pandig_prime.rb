require 'Prime'
require_relative '35_circular_primes.rb'

def is_pandig_prime?(num)
  correct = (1..num.to_s.length).to_a

  check = dig_array(num).sort
  check == correct && Prime.prime?(num) 
end

def list_out
  poss = []
  (1..9).to_a.each do |bound|
    poss += (1..bound).to_a.permutation.to_a
  end
  poss.map { |x| x.join("").to_i }
end

p list_out.find_all{ |x| is_pandig_prime?(x) }.max