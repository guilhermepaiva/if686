import Data.Char


fat n = if n == 0 then 1 else n * fat (n-1)

fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = n * fatorial (n-1) 

procIndice :: [Integer] -> Integer -> [Integer]
procIndice [] i = []
procIndice (x:xs) 0 = [x]
procIndice (x:xs) i = procIndice xs (i-1)

conc :: [Integer] -> [Integer] -> [Integer]
conc [] l = l
conc (x:xs) l = x : conc xs l