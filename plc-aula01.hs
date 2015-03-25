 answer :: Int
 answer = 42

 greater :: Bool
 greater = (answer > 71)

 yes :: Bool
 yes = True

 --definicao de funcoes
 square :: Int -> Int
 square x = x * x

 allEqual :: Int -> Int -> Int -> Bool
 allEqual n m p = (n == m) && (m == p)

 maxi :: Int -> Int -> Int
 maxi n m
 	| n >= m = n
 	| otherwise = m

 --exemplo
 vendas :: Int -> Int
 vendas n = n
 
 totalVendas :: Int  -> Int
 totalVendas n 
 	| n == 0 = vendas 0
 	| otherwise = totalVendas (n-1) + vendas n

 --somear elementos de uma lista de forma recursiva
 sumList :: [Int] -> Int
 sumList as 
 	| as == [] = 0
 	| otherwise = (head as) + sumList (tail as)

--dobrar os elementos de uma lista
doubleList :: [Int] -> [Int]
doubleList [] = []
doubleList (n:ns) = (2 * n) : doubleList ns



