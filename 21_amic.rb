def factor_sum(num)
  hold = []
  (1.. num / 2).to_a.each do |fact|
    hold << fact if num % fact == 0
  end 
  hold.inject{ |sum, x| sum += x }
end

def array_build(bound)
  hold = []
  (1.. bound).to_a.each do |num|
    hold << [num, factor_sum(num)] 
  end
  hold
end

def solve(array)
  sum = 0
  array.each do |check_a|
    continue = true
    array.each do |check_b|
      if check_a[0] != 1 && check_a[0] != check_b[0] && 
                            check_b[0] == check_a[1] &&
                            check_a[0] == check_b[1]
        sum += check_a[0]
        continue = false
      end
      break if continue == false 
    end
  end
  return sum
end

p solve(array_build(10_000))

