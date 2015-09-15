import Data.Char

procIndice :: [Integer] -> Integer -> [Integer]
procIndice [] i = []
procIndice (x:xs) 0 = [x]
procIndice (x:xs) i = procIndice xs (i-1)

conc :: [Integer] -> [Integer] -> [Integer]
conc [] l = l
conc (x:xs) l = x : conc xs l