integerToFloat :: Integer -> Float
integerToFloat x = fromInteger (toInteger x)

split :: Integer -> [Float]
split 0 = []
split x = split (x `div` 10) ++ [integerToFloat(x `mod` 10)]

splitRaiseFifth :: Integer -> Float
splitRaiseFifth x = sum( map(\i -> i ** 5) (split x) )

solve = sum( filter(\i -> splitRaiseFifth(i) == integerToFloat(i)) [0.. 354294] )

--Type declarations were difficult here - let's get feedback on more elegant

