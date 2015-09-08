--exercicios da aula 3
import Data.Char

--funções polimorficas funcionam para qualquer tipo de dado

--funções monomórficas funcionam para apenas um tipo de dado
myCapitalize :: Char -> Char
myCapitalize ch = chr (ord ch + offset)
	where offset = ord 'A' - ord 'a'

-- polimorfismo: função possui um tipo genérico, uso de variáveis de tipo
myZip :: [t] -> [u] -> [(t,u)]
myZip [] _ = []
myZip _ [] = []
myZip (a:as) (b:bs) = (a, b) : myZip as bs

myLength :: [t] -> Int
myLength [] = 0
myLength (a:as) = 1 + myLength as

rev :: [t] -> [t]
rev [] = []
rev (a:as) = rev as ++ [a]

myId :: t -> t
myId x = x


--inferência de tipos (digitar no ghci :type rep)
rep 0 ch = []
rep n ch = ch : rep (n-1) ch

myTake :: Int -> [t] -> [t]
myTake 0 _ = []
myTake n (a:as) = a : myTake (n-1) as

myDrop :: Int -> [t] -> [t]
myDrop 0 as = as
myDrop n (a:as) = myDrop (n-1) as

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile f [] = []
myTakeWhile f (x:xs)
	| f x = x : myTakeWhile f xs
	| otherwise = []

myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile _ [] = []
myDropWhile f (x:xs)
	| f x = myDropWhile f xs
	| otherwise = x:xs


--fatorial
fat :: Int -> Int
fat n
	| n == 0 = 1
	| otherwise = n * fat (n - 1)

--compara se tres numeros sao iguais
allEqual :: Int -> Int -> Int -> Bool
allEqual n m p 
	| (n == m) && (m == p) = True
	| otherwise = False

member :: Eq t => [t] -> t -> Bool
member [] _ = False
member (a:as) b
	| a == b = True
	| otherwise = member as b

--compara se quatro numeros sao iguais utilizando o allEqual
all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal n m o p 
	| (n == m) && allEqual m o p = True
	| otherwise = False

--retorna quantos parametros sao iguais
equalCount :: Int -> Int -> Int -> Int
equalCount x y z
	| allEqual x y z = 3
	| (x == y) && (y /= z) = 2
	| (y == z) && (z /= x) = 2
	| otherwise = 0

--definicoes locais
sumSquares :: Int -> Int -> Int
sumSquares x y = sqX + sqY
	where 
		sqX = x * x
		sqY = y * y

agrupar :: (Eq t) => [[t]] -> [(t, Int)]
agrupar x = count (concat x)

count :: (Eq t) => [t] -> [(t, Int)]
count [] = []
count l@(x:xs) = [(x, length ([a | a <- l, a == x]))] ++ count [a | a <- l, a /= x]