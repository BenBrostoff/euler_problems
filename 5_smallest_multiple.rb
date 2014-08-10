def factorial_ten_shorten(x)
	return 1 if x == 1
	x * factorial(x-1) 
end

# def smallest_multiple(x) #x as 10 in problem

# 	attempt = factorial(x) / factor 
# 		while attempt % x == 0 #
# 			attempt /= x 
# 			x -= 1
# 			if x == 0
# 				factor == 0
# 				return attempt
# 			end
# 			else
# 				factor -= 1 #try next factor
# 			end
# 		end 
# 	end

factorial(10)
