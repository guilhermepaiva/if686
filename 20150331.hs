{- Primeira Questão 
O polimorfismo de haskell é mais seguro, pois temos a garantia que os tipos terão implementações das funcionalidades que serão 
utilizadas sob eles, pois é possível restringir que os argumentos genéricos  possuam implementações de determinadas funções, sendo esses definidos por uma
classe. 
Em Java, o Generics que é utilizado no polimorfismo acaba sendo mais geral pois não restringe os dados, porém é mais sucetível à erro.
-}

-- Segunda Questão

--count conta quantas vezes um determinado número aparece na lista
count :: (Eq t, Num t) => t -> [t] -> t
count _ [] = 0
count n (a:as)
	| a == n = 1 + count n as
	| otherwise = count n as

--remove o primeiro elemento da lista (se for igual ao parametro n) quantas vezes ele aparecer
remove :: Eq t => t -> [t] -> [t]
remove _ [] = []
remove n (a:as)
	| a == n = remove n as
	| otherwise = a:as

--conta quantas vezes um determinado elemento aparece na lista e coloca a quantidade de vezes que ele aparece seguido do número
countAndRemove :: (Eq t, Num t) => [t] -> [t]
countAndRemove [] = []
countAndRemove (a:as) = [(count a as) + 1] ++ [a] ++ countAndRemove (remove a as)

lookAndSay :: (Eq t, Num t) => Int -> t -> [t]
lookAndSay 0 _ = []
lookAndSay n i = lookAndSay' n [i]

lookAndSay' :: (Eq t, Num t) => Int -> [t] -> [t]
lookAndSay' _ [] = []
lookAndSay' n as
	| n > 1 = lookAndSay' (n-1) (countAndRemove as)
	| otherwise = as
