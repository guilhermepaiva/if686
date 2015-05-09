--laziness
-- lazy evaluation: avaliação de uma expressão se dá apenas quando seu valor é necessário.

f :: Int -> Int -> Int
f a b = a + b
-- ex.: f (9-3) (f 3 5)

h :: Int -> Int -> Int
h a b = a + 12

g :: Int -> Int
g c = c + g c

-- ex1.: h 3 (g 0) = 15
-- ex2.: h (g 0) 3 = entra em loop infinito

i :: [Int] -> [Int] -> Int
i (a:as) (b:bs) = a + b

-- ex.: i [1..] [2..] = 3

-- chamadas de cauda: tornam desnecessário empilhar um stack frame por chamada

fat :: Int -> Int
fat n = tailFat n 1
tailFat 0 x = x
tailFat n x = tailFat (n-1) (n*x)

-- implementar getWord, splitWord e dropWord usando chamadas de cauda
getWord :: String -> String
getWord st = takeWhile (/= ' ') st

getWordCauda :: String -> String
getWordCauda st = tailGetWord st ""
tailGetWord [] st = st
tailGetWord (a:as) st
	| a == ' ' = st
	| otherwise = tailGetWord as (st++[a])