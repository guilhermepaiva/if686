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


