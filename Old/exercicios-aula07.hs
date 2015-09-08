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

dropWord :: String -> String
dropWord st = dropWhile (/= ' ') st

dropSpace :: String -> String
dropSpace st = dropWhile (== ' ') st

type Word = String
splitWords :: String -> [Word]
splitWords [] = []
splitWords st = [getWord st] ++ splitWords (dropSpace(dropWord st))

getWordCauda :: String -> String
getWordCauda st = tailGetWord st ""
tailGetWord [] st = st
tailGetWord (a:as) st
	| a == ' ' = st
	| otherwise = tailGetWord as (st++[a])

dropWordCauda :: String -> String
dropWordCauda st = tailDropWord st ""
tailDropWord [] st = st
tailDropWord (a:as) st
	| a == ' ' = as
	| otherwise = tailDropWord as (st++[a])

dropSpaceCauda :: String -> String
dropSpaceCauda st = tailDropSpace st ""
tailDropSpace [] st = st
tailDropSpace (a:as) st
	| a /= ' ' = (a:as)
	| otherwise = tailDropSpace as (st++[a])

splitWordsCauda :: String -> [String]
splitWordsCauda st = tailSplitWords st ""
tailSplitWords [] st = [st]
tailSplitWords (a:as) st
	| a == ' ' && (length st) > 0 = st : (tailSplitWords as "")
	| a == ' ' && (length st) == 0 = (tailSplitWords as "")
	| otherwise = tailSplitWords as (st++[a])

foldrCauda :: (a -> b -> b) -> b -> [a] -> b
foldrCauda _ n [] = n
foldrCauda f n (a:as) = f a (foldrCauda f n as)





















