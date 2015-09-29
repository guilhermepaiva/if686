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

myMember :: Eq t => t -> [t] -> Bool
myMember e [] = False
myMember e (a:as) 
	| e == a = True
	| otherwise = myMember e as

--removeDups :: [t] -> [t]
removeDups [] = []
removeDups (e:l) = if myMember  e l then removeDups l else e : removeDups l

-- Ao invés de recursão, podemos usar compreensão de listas

removerc :: Eq t => t -> [(t, t1)] -> [(t, t1)] 
removerc n l = [(n1, s) | (n1, s) <- l, n1 /= n]
--teste: removerc "9898" [("1212", 100), ("1111", 9999), ("9898", 9090), ("6543", 876)]

procurarc :: Eq t => t -> [(t, t1)] -> [(t, t1)]
procurarc n l = [(n1, s) | (n1, s) <- l, n1 == n]
--teste: procurarc "9898" [("1212", 100), ("1111", 9999), ("9898", 9090), ("6543", 876)]

creditarConta :: Num t1 => (t, t1) -> t1 -> (t, t1)
creditarConta (n, s) v = (n , s+v)

creditarc :: (Num t1, Eq t) => t -> t1 -> [(t, t1)] -> [(t, t1)]
creditarc n v l = [if n == n1 then creditarConta (n1, s) v else (n1, s) | (n1, s) <- l]
--teste: creditarc "1212" 35 [("1212", 100), ("1111", 9999), ("9898", 9090), ("6543", 876)]

creditarcc :: (Num t, Eq a) => a -> t -> [(a, t)] -> [(a, t)]
creditarcc n v l = [(n1, s) | (n1, s) <- l, n1 /= n] ++ [creditarConta (n1, s) v | (n1, s) <- l, n1 == n]
--teste: creditarcc "1212" 35 [("1212", 100), ("1111", 9999), ("9898", 9090), ("6543", 876)]


unique :: Eq a => [a] -> [a]
unique [] = []
unique [e] = [e]
unique (x:y:ys)
	| x == y = unique (y:ys)
	| otherwise = x : unique (y:ys)

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


{--

--}










