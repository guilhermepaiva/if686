import Data.Char
import Data.List
import Data.Map
{--
Polimorfismo, várias funções com o mesmo nome, assumindo várias formas. 
Diversos tipos de polimorfismo (de subtipo, ad hoc, paramétrico)
--}

zipp :: [t] -> [u] -> [(t, u)]
zipp (a:as) (b:bs) = (a,b):zipp as bs
zipp _ _ = []

{--removeDups :: [t] -> [t]
removeDups [] = []
removeDups (e:l) = if member e l then removeDups l else e:removeDups l--}

-- Ao invés de recursão, podemos usar compreensão de listas

removerc n l = [(n1, s) | (n1, s) <- l, n1 /= n]

qsort :: [Int] -> [Int]
qsort [] = []
qsort (x:xs) = qsort [e | e <- xs, e <= x] ++ [x] ++ qsort [e | e <- xs, e > x]

qsortWhere :: [Int] -> [Int]
qsortWhere [] = []
qsortWhere (x:xs) = l ++ [x] ++ r
	where
		l = qsortWhere [e | e <- xs, e <= x]
		r = qsortWhere [e | e <- xs, e > x]

mySplit :: Ord t => t -> [t] -> ([t], [t])
mySplit p [] = ([], [])
mySplit p (x:xs) = if (x >= p) then (l, x:r) else (x:l, r)
	where 
		(l,r) = mySplit p xs


qsortSplit :: [Int] -> [Int]
qsortSplit [] = []
qsortSplit (x:xs) = qsortSplit l ++ [x] ++ qsortSplit r
	where 
		(l, r) = mySplit x xs

