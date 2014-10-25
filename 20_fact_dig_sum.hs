factorial :: Integer -> Integer
factorial n = if n == 0 then 1 else n * factorial (n - 1)

split :: Integer -> [Integer]
split 0 = []
split x = split (x `div` 10) ++ [x `mod` 10]

solve :: Integer -> Integer
solve x = sum( split (factorial x) ) 

--solve(100)

