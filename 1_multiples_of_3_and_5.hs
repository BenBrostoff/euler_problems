three_five_mults :: Int -> Int
three_five_mults x = sum(filter(\i -> i `mod` 3 == 0 || i `mod` 5 == 0)[0.. x])

--three_five_mults(999)
