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

maxVendas :: Int -> Int
maxVendas n
	| n == 0 = vendas 0
	| otherwise = maxi (maxVendas (n - 1)) (vendas n)
		where vendas n = 2*n

sumList :: [Int] -> Int
sumList as 
	| as == [] = 0
	| otherwise = (head as) + sumList (tail as)

doubleListElements :: [Int] -> [Int]
doubleListElements as
	| as == [] = []
	| otherwise = (2 * (head as)) : doubleListElements (tail as) 

myMember :: [Int] -> Int -> Bool
myMember as n
	| as == [] = False
	| (head as) == n = True
	| otherwise = myMember (tail as) n

isDigit :: Char -> Bool
isDigit x
	| x == '0' || x == '1' || x == '2' || x == '3' || x == '4' || x == '5' || x == '6' || x == '7' || x == '8' || x == '9' = True 
	| otherwise = False

filterDigits :: String -> String
filterDigits st = [a | a <- st, isDigit a]

sumPairs :: [Int] -> [Int] -> [Int]
sumPairs [] [] = []
sumPairs as bs = (head as) + (head bs) : sumPairs (tail as) (tail bs)

--devolver o maior elemento da lista
maiorLista :: [Int] -> Int
maiorLista [] = minBound :: Int
maiorLista [x] = x
maiorLista (x:xs)
	| x > maiorLista xs = x
	| otherwise = maiorLista xs

-- devolve o menor valor de uma lista
menorLista :: [Int] -> Int
menorLista [] = minBound :: Int
menorLista [x] = x
menorLista (x:xs)
	| x < menorLista xs = x
	| otherwise = menorLista xs

myListLenght :: [Int] -> Int
myListLenght [] = 0
myListLenght (a:as) = 1 + myListLenght as

fibonacciSequence :: Int -> [Int]
fibonacciSequence 0 = [0]
fibonacciSequence 1 = [1, 0]
fibonacciSequence n = (head (fibonacciSequence(n-1)) + head (fibonacciSequence(n-2))) : fibonacciSequence (n-1)











