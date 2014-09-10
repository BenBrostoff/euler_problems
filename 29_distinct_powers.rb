def dist_pow(a_up, a_low, b_up, b_low)
  sol = []
  (a_up.. a_low).to_a.each do |a|
    (b_up.. b_low).to_a.each do |b|
      sol << a ** b
    end
  end
  return sol.uniq.size
end

p dist_pow(2,100,2,100)
