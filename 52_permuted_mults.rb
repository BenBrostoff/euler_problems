def int_order(num)
  num.to_s.split("").map { |x| x.to_i }.sort
end

def mult_find(num)
  hold = []
  (1..6).to_a.each do |mult|
    hold << int_order(num * mult)
  end
  return true if hold.uniq.length == 1
end


def check 
  final, status = 0, false
  while status != true
    final += 1
    status = true if mult_find(final) == true
  end
  return final 
end

p check