maiorLista :: [Int] -> Int
maiorLista [] = minBound :: Int
maiorLista [x] = x
maiorLista (x:xs)
	| x > maiorLista xs	= x
	| otherwise	= maiorLista xs