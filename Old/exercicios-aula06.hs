--aplicação parcial de função

multiply :: Int -> Int -> Int
multiply a b = a*b

doubleList :: [Int] -> [Int]
doubleList = map (multiply 2)

add :: Int -> (Int -> Int)
add x y = x + y

addOne = add + 1