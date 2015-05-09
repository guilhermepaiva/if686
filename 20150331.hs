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

--Terceira Questão
type Rotulo = Int
type No = (Rotulo, [Rotulo])
type Grafo = [No]
type Arestas = (Rotulo, Rotulo)
type Caminho = [Arestas]

findRotulo :: [Rotulo] -> Rotulo -> Bool
findRotulo [] _ = False
findRotulo (a:as) r
	| r == a = True
	| otherwise = findRotulo as r

-- função que dado um grafo e um rótulo retorna os rótulos adjacentes a ele
getRotulosAdjacentes :: Grafo -> Rotulo -> [Rotulo]
getRotulosAdjacentes (g:gs) r
	| fst g == r = snd g
	| otherwise = getRotulosAdjacentes gs r

search :: Grafo -> Rotulo -> Rotulo -> Caminho
search [] _ _ = []
search (a:as) ri rf
	| (getRotulosAdjacentes a ri /= []) = [(ri, fst a)] : getRotulosAdjacentes as ri
	| otherwise = getRotulosAdjacentes as ri


myGraph :: Grafo
myGraph = [(1, [5,2,4,3]), (2, [5,1]), (3, [1,6]), (4, [7,1]), (5,[1,2]), (6, [3,7]), (7, [4,6])]







