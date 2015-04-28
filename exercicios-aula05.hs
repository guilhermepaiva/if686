import Data.Char (ord)

-- uma função de alta ordem (boba)
applyBinOper :: (t -> t -> t) -> t -> t -> t
applyBinOper  f x y = f x y


-- funções de mapeamento (mapping)
double :: [Int] -> [Int]
double [] = []
double (a:as) = 2*a : double as

sqrList :: [Int] -> [Int]
sqrList [] = []
sqrList (a:as) = a*a : sqrList as

--funções de tranformação dos elementos
times2 :: Int -> Int
times2 n = 2*n

sqr :: Int -> Int
sqr n = n*n

--mapeamento (map)
myMap :: (t -> u) -> [t] -> [u]
myMap f [] = []
myMap f (a:as) = f a : myMap f as

doubleList :: [Int] -> [Int]
doubleList xs = map times2 xs

anotherSqrList :: [Int] -> [Int]
anotherSqrList xs = map sqr xs

seconds :: [(t, u)] -> [u]
seconds xs = map snd xs

-- uma função que calcula a raiz quadrada de todos os elemento de uma lista
sqrtList :: [Float] -> [Float]
sqrtList xs = map sqrt xs

posicaoAlfabeto :: String -> [Int]
posicaoAlfabeto "" = []
posicaoAlfabeto st = map ord st

myMapComprehension :: (t -> u) -> [t] -> [u]
myMapComprehension f as = [f x | x <- as]

myMaximum :: [Int] -> Int
myMaximum [a] = a
myMaximum (a:as) = max a (myMaximum as)

zeroInRange :: [Int] -> Bool
zeroInRange [] = False
zeroInRange (a:as) = (||) (a == 0) (zeroInRange as)

myProduct :: [Int] -> Int
myProduct [] = 1
myProduct (a:as) = (*) (a) (myProduct as)

data Tree t = NilT | Node t (Tree t) (Tree t)
	deriving (Show)

t :: Tree Int
t = Node 9 (Node 5 NilT NilT) (Node 7 NilT NilT)

insert :: Ord t => Tree t -> t -> Tree t
insert (NilT) el = Node el NilT NilT
insert (Node a left right) el
	| el >= a = Node a left (insert right el)
	| otherwise = Node a (insert left el) right

--TODO createTree :: [Int] -> Tree Int


-- folding

sumList :: [Int] -> Int
sumList [] = 0
sumList (a:as) = (+) (a) (sumList as)

fold :: (t -> t-> t) -> [t] -> t
fold f [a] = a
fold f (a:as) = f a (fold f as)

anotherSumList :: [Int] -> Int
anotherSumList l = fold (+) l

anotherAnd :: [Bool] -> Bool
anotherAnd xs = fold (&&) xs

anotherConcat :: [[t]] -> [t]
anotherConcat xs = fold (++) xs

anotherMaximum :: [Int] -> Int
anotherMaximum xs = fold max xs

foldFatorial :: Int -> Int
foldFatorial n = fold (*) [1..n]

myFoldr :: (t -> u -> u) -> u -> [t] -> u
myFoldr f s [] = s
myFoldr f s (a:as) = f a (myFoldr f s as) 

myMember :: Int -> [Int] -> Bool
myMember el [] = False
myMember el (x:xs)
	| (myFoldr (-) el [x]) == 0 = True
	| otherwise = myMember el xs









