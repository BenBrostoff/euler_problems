PRIMES = [2, 3, 5, 7 , 11, 13, 17]

def check(num, prime_array)
  array = num.to_s.split("")
  array.each_with_index do |dig, index|
    if index > 0 && index < array.length - 2
      pair = [prime_array[index-1], 
             (array[index] + array[index + 1] + array[index + 2]).to_i]
      return false if pair[1] % pair[0] != 0 
    end
  end
  return true
end

def narrow(array)
  array.find_all { |x| x[0] != 0 && 
                   x[3] % 2 == 0 && 
   (x[2] + x[3] + x[4]) % 3 == 0 &&
          (x[5] == 5 || x[5] == 0) }
end

def solve
  hold, filter = [], narrow((0.. 9).to_a.permutation.to_a)
  filter.each_with_index do |x, index|
    hold << x.join("").to_i if check(x.join("").to_i, PRIMES) 
  end
  hold.inject { |sum, n| sum += n }
end

p solve