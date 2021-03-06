import Data.Maybe

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

myListLenght :: [t] -> Int
myListLenght [] = 0
myListLenght (a:as) = 1 + myListLenght as

fibonacciSequence :: Int -> [Int]
fibonacciSequence 0 = [0]
fibonacciSequence 1 = [1, 0]
fibonacciSequence n = (head (fibonacciSequence(n-1)) + head (fibonacciSequence(n-2))) : fibonacciSequence (n-1)

addPair :: (Int, Int) -> Int
addPair (x, y) = x+y

shift :: ((Int, Int), Int) -> (Int, (Int, Int))
shift ((x, y), z) = (x, (y,z))

-- sinonimos de tipos

type Name = String
type Age = Int
type Phone = Int
type Person = (Name, Age, Phone)

name :: Person -> Name
name (n, a, p) = n

type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

doubleListComprehention :: [Int] -> [Int]
doubleListComprehention as = [2*a | a <- as]

sumPairsComprehention :: [(Int, Int)] -> [Int]
sumPairsComprehention lp = [a+b | (a,b) <- lp]

digitsComprehention :: String -> String
digitsComprehention st = [x | x <- st, isDigit x]

isEven :: Int -> Bool
isEven x 
	| x `mod` 2 == 0 = False
	| otherwise = True

doubleIfEven :: [Int] -> [Int]
doubleIfEven as = [2*x | x <- as, isEven x]

myZip :: [t] -> [u] -> [(t, u)]
myZip (a:as) (b:bs) = (a, b) : myZip as bs
myZip _ _ = []

rev :: [t] -> [t]
rev (a:as) = rev as ++ [a]
rev [] = []

rep :: Int -> t -> [t]
rep 0 ch = []
rep n ch = ch : rep (n-1) ch

myTake :: Int -> [t] -> [t]
myTake 0 _ = []
myTake n (a:as) = a : myTake (n-1) as

--definições locais
sumSquares :: Int -> Int -> Int
sumSquares x y = sq x + sq y
	where sq z = z*z

-- outra implementação de isDigit
ehDigito :: Char -> Bool
ehDigito ch = ('0' <= ch) && ('9' >= ch)

-- funções de alta ordem
applyBinOper :: (t -> t -> t) -> t -> t -> t
applyBinOper f x y = f x y

myMap :: (t -> u) -> [t] -> [u]
myMap f [] = []
myMap f (a:as) = f a : myMap f as

seconds :: [(t, u)] -> [u]
seconds xs = myMap snd xs

sqRootList :: [Float] -> [Float]
sqRootList (a:as) = map sqrt (a:as) 

myMapComprehention :: (t -> u) -> [t] -> [u]
myMapComprehention f lst = [f a | a <- lst]

zeroInRange :: [Int] -> Bool
zeroInRange [] = False
zeroInRange (a:as) = (||) (a == 0) (zeroInRange as)

productList :: [Int] -> Int
productList [] = 1
productList (a:as) = (*) a (productList as)

myFold :: (t -> t -> t) -> [t] -> t
myFold f [a] = a
myFold f (a:as) = f a (myFold f as)

memberFoldr :: Int -> [Int] -> Bool
memberFoldr x [] = False
memberFoldr x (a:as)
	| (foldr (-) x [a]) == 0 = True
	| otherwise = memberFoldr x as 

unionFoldr :: [t] -> [t] -> [t]
unionFoldr a b = foldr (:) a [] ++ foldr (:) b []

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (pivot:res) = (quicksort [y | y <- res, y < pivot]) ++ [pivot] ++ (quicksort [y | y <- res, y >= pivot])

type Node t = t
data Tree t = NilT | Node t (Tree t) (Tree t)
	deriving (Eq, Show)

insertNode :: (Ord t) => Tree t -> t -> Tree t
insertNode (NilT) n = (Node n (NilT) (NilT))
insertNode (Node x a b) n = if n >= x then (Node x a (insertNode b n))
	else (Node x (insertNode a n) b)

createTree :: (Ord t) => [t] -> (Tree t -> t -> Tree t) -> Tree t
createTree li _ = foldr (\x t -> insertNode t x) (NilT) (reverse li)

-- Monads

safeDiv :: Integral t => Maybe t -> Maybe t -> Maybe t
safeDiv _ Nothing = Nothing
safeDiv Nothing _ = Nothing
safeDiv (Just x) (Just y)
	| y /= 0 = Just (x `div` y)
	| otherwise = Nothing

putNTimes :: Int -> String -> IO ()
putNTimes n str 
	= if n <= 1
		then putStr str
		else do putStr str 
			putNTimes (n-1) str

merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x <= y
                      then x : merge xs (y:ys)
                      else y : merge (x:xs) ys

mergesort [] = []
mergesort [x] = [x]
mergesort xs = let (as, bs) = splitAt (length xs `quot` 2) xs
               in merge (mergesort as) (mergesort bs)



						













