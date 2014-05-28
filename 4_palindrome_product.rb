def palindrome_check(num)
	array = num.to_s.split("")
	new_array = array.map{|i| i.to_i}
	if new_array == new_array.reverse
		true
	else
		false
	end
end

def multiple_check(num)
	array = (100.. 999).to_a
	check = false
	empty_array = []
	array.each do |i|
		check = true if num % i == 0 && num / i < 1000 && num / i > 99
		empty_array << i if num % i == 0 && num / i < 1000 && num / i > 99
		end
	check
	empty_array
end


#palindrome_array = (100*100.. 999*999).find_all{|i| palindrome_check(i)}
#final_array = palindrome_array.find_all{|i| multiple_check(i)}

#final_array.last
multiple_check(906609)
