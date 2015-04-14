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
myMap f (a:as) = f a : map f as