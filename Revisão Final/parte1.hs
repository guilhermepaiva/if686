square :: Int -> Int
square x = x * x

allEqual :: Int -> Int -> Int -> Bool
allEqual m n p = (m == n) && (n == p)

maxi :: Int -> Int -> Int
maxi m n 
	| m > n = m
	| otherwise = n

totalVendas :: Int -> Int
totalVendas n
	| n == 0 = vendas 0
	| otherwise = totalVendas (n - 1) + vendas n
		where vendas n = 2*n