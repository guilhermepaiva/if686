import Data.Char


fat n = if n == 0 then 1 else n * fat (n-1)

-- casamento de padrão e recursão, tipos fortes, mas com inferência de tipos

fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = n * fatorial (n-1) 

max :: Int -> Int -> Int
max a b = if (a > b) then a else b

xor :: Bool -> Bool -> Bool
xor a b = (a || b) && not(a && b)

axor :: Bool -> Bool -> Bool
axor True a = not a
axor False a = a

offset = ord 'A' - ord 'a'

maiuscula :: Char -> Char 
maiuscula ch = if (ch >= 'a' && ch <= 'z') then
	chr (ord ch + offset)
	else ch

-- tuplas e agregando valores
addPair :: (Int, Int) -> Int
addPair (a,b) = a+b

shift :: ((Int, Int), Int) -> (Int, (Int, Int))
shift ((x, y), z) = (x, (y,z))

-- nomeando tipos
type Name = String
type Age = Int
type Phone = Int
type Person = (Name, Age, Phone)

name :: Person -> Name
name (n, a, p) = n

type Saldo = Double
type Conta = (String, Saldo)

creditarConta :: Conta -> Double -> Conta
creditarConta (n, s) v = (n, s+v)

debitarConta :: Conta -> Double -> Conta
debitarConta (n, s) v = (n, s-v)

-- listas

soma :: [Int] -> Int
soma [] = 0
soma (a:as) = a + soma as

nossoHead :: [t] -> t
nossoHead (x:xs) = x

tamanho :: [t] -> Int
tamanho [] = 0
tamanho (x:xs) = 1 + tamanho xs

f1 0 = 1
f1 n = n * f1 (n-1)

f2 0 = 0
f2 m = m * f2 (m-1)

-- contar elementos de uma lista

count :: (Num a, Eq a1) => a1 -> [a1] -> a
count e [] = 0
count e (a:as) = if e == a then 1 + count e as
	else 0 + count e as

anotherCount :: (Num a, Eq a1) => a1 -> [a1] -> a
anotherCount e [] = 0
anotherCount e (a:as)
	| a == e = 1 + anotherCount e as
	| otherwise = anotherCount e as



member :: Eq t => t -> [t] -> Bool
member e [] = False
member e (a:as) 
	| e == a = True
	| otherwise = member e as

-- reuso vs. eficiência
anotherMember :: Eq t => t -> [t] -> Bool
anotherMember e l = (count e l) > 0

union :: Eq t => [t] -> [t] -> [t]
union [] c = c
union (x:xs) c 
	| member x c = union xs c
	| otherwise = x:(union xs c) 

intersection :: Eq t => [t] -> [t] -> [t]
intersection [] l = []
intersection (a:as) l
	| member a l = a:(intersection as l)
	| otherwise = intersection as l 


diff :: Eq t => [t] -> [t] -> [t]
diff [] _ = []
diff l [] = l
diff (a:as) l 
	| member a l = diff as l
	| otherwise = a:(diff as l)
 







