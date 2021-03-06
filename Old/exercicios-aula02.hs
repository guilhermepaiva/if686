--exercicios da aula 02 de PLC

addPair :: (Int, Int) -> Int
addPair (x, y) = x + y

shift :: ((Int, Int), Int) -> (Int, (Int, Int))
shift ((x,y), z) = (x, (y, z)) 

--sinônimos de tipos
type Name = String
type Age = Int
type Phone = Int
type Person = (Name, Age, Phone)

name :: Person -> Name
name (n, a, p) = n

--equação do segundo grau
oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b/(2.0*a)

twoRoots :: Float -> Float -> Float -> (Float, Float)
twoRoots a b c = (d-e, d+e)
	where
		d = -b/(2.0*a)
		e = sqrt(b^2-4.0*a*c)/(2.0*a)

roots :: (Float, Float, Float) -> String
roots (a, b, c)
	| b^2-4.0*a*c == 0 = show (oneRoot a b c)
	| b^2 > 4.0*a*c = show f ++ " " ++ show s
	| otherwise = "no roots"
		where
			f = fst (twoRoots a b c)
			s = snd (twoRoots a b c)


menor :: Int -> Int -> Int
menor a b
	| a < b = a
	| otherwise = b

maior :: Int -> Int -> Int
maior a b
	| a > b = a
	| otherwise = b

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c
	| a < menor b c = (a, menor b c)
	| b < menor a c = (b, menor a c)
	| c < menor a b = (c, menor a b)
	| otherwise = (menor a b, menor b c)

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a, b, c)
	| a <= menor b c = (a, menor b c, maior b c)
	| b <= menor a c = (b, menor a c, maior a c)
	| c <= menor a b = (c, menor a b, maior a b)

 
type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

primeiraCoordenadaPonto :: Ponto -> Float
primeiraCoordenadaPonto (a, b) = a

segundaCoordenadaPonto :: Ponto -> Float
segundaCoordenadaPonto (a, b) = b

retaVertical :: Reta -> Bool
retaVertical ((x1, y1), (x2, y2))
	| x1 == x2 = True
	| otherwise = False

pontoY :: Float -> Reta -> Float
pontoY x ((x1, y1),(x2, y2))
	| retaVertical ((x1, y1),(x2, y2)) = error "A reta eh vertical"
	| otherwise = ((y2 - y1)/(x2 - x1)) * (x - x1) + y1


-- expressão case
firstDigit :: String -> Char
firstDigit st = case (digits st) of
	[] -> '\0'
	(a:as) -> a

-- compreensão de listas

doubleList :: [Int] -> [Int]
doubleList xs = [2*a | a <- xs, isEven a] 

isEven :: Int -> Bool
isEven a
	| a `mod` 2 == 0 = False
	| otherwise = True

sumPairs :: [(Int, Int)] -> [Int]
sumPairs lp = [a+b | (a,b) <- lp]

isDigit :: Char -> Bool
isDigit x
	| x == '0' || x == '1' || x == '2' || x == '3' || x == '4' || x == '5' || x == '6' || x == '7' || x == '8' || x == '9' = True
	| otherwise = False

digits :: String -> String
digits st = [a | a <- st, isDigit a]

myLength :: [t] -> Int
myLength [] = 0
myLength (a:as) = 1 + myLength as

-- exemplo biblioteca
type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados
baseExemplo = 
	[("Sergio", "O Senhor dos Aneis"),
	("Andre", "Duna"),
	("Fernando", "Jonathan Strange & Mr. Norrell"),
	("Fernando", "A Game of Thrones")]

--funções sobre o banco de dados - consultas
livros :: BancoDados -> Pessoa -> [Livro]
livros [] _ = []
livros (x:xs) p
	| fst x == p = (snd x):livros xs p
	| otherwise = livros xs p

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos [] _ = []
emprestimos (x:xs) l
	| snd x == l = fst x : emprestimos xs l
	| otherwise = emprestimos xs l

emprestado :: BancoDados -> Livro -> Bool
emprestado [] _ = False
emprestado (x:xs) l
	| snd x == l = True
	| otherwise = emprestado xs l

qtdeEmprestimos :: BancoDados -> Pessoa -> Int
qtdeEmprestimos [] _ = 0
qtdeEmprestimos (x:xs) p
	| fst x == p = 1 + qtdeEmprestimos xs p
	| otherwise = qtdeEmprestimos xs p

-- funções sobre o banco de dados - atualizações
emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar [] p l = [(p,l)]
emprestar bd p l = (p,l) : bd

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver [] p l = []
devolver (x:xs) p l
	| fst x == p && snd x == l = xs
	| otherwise = devolver xs p l

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (a:as) = quicksort ([x | x <- as, x <= a]) ++ [a] ++ quicksort ([x | x <- as, x > a])

getWord :: String -> String
getWord st = takeWhile (/= ' ') st

dropWord :: String -> String
dropWord st = dropWhile (/= ' ') st

dropSpace :: String -> String
dropSpace st = dropWhile (== ' ') st

dropAllSpaces :: String -> String
dropAllSpaces st = [x | x <- st, x /= ' ']

type Word = String
splitWords :: String -> [Word]
splitWords [] = []
splitWords st = [getWord st] ++ splitWords (dropSpace(dropWord st))

type Line = [Word]
myGetLine :: Int -> [Word] -> Line
myGetLine 0 _ = []
myGetLine i (a:as) = a : myGetLine (i-1) as  

myDropLine :: Int -> [Word] -> [Word]
myDropLine 0 _ = []
myDropLine i (a:as) = as ++ myDropLine (i-1) as

splitLines :: [Word] -> [Line]
splitLines [] = []
splitLines (a:as) = [a] : splitLines as

fill :: String -> [Line]
fill st = splitLines (splitWords st)

joinWords :: [Word] -> String
joinWords x
	| x == [] = []
    | otherwise = (head x) ++ (joinWords (tail x))

joinLines :: [Line] -> String
joinLines x 
	| x == [] = []
    | otherwise = (joinWords (head x)) ++ (joinLines (tail x))















