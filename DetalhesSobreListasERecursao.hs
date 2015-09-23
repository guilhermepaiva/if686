tamanho :: [t] -> Int
tamanho [] = 0
tamanho (x:xs) = 1 + tamanho xs

procIndice :: [Integer] -> Integer -> [Integer]
procIndice [] i = []
procIndice (x:xs) 0 = [x]
procIndice (x:xs) i = procIndice xs (i-1)

conc :: [Integer] -> [Integer] -> [Integer]
conc [] l = l
conc (x:xs) l = x : conc xs l

-- mais funções sobre listas, agora com contas

cadastrarBugado :: a -> [a] -> [a]
cadastrarBugado c l = l ++ [c]

procurar :: Eq a => a -> [(a, t)] -> [(a, t)]
procurar n [] = []
procurar n1 ((n2,s):l)
	| n1 == n2 = [(n2, s)]
	| otherwise = procurar n1 l

remover :: Eq a => a -> [(a, t)] -> [(a, t)]
remover n1 [] = []
remover n1 ((n2, s):l)
	| n1 == n2 = l
	| otherwise = (n2, s) : remover n1 l

creditar :: (Num t1, Eq t) => t -> t1 -> [(t, t1)] -> [(t, t1)]
creditar n v [] = []
creditar n1 v ((n2, s):l)
	| n1 == n2 = (n2, s+v) : l
	| otherwise = (n2, s) : creditar n1 v l

debitar :: (Num t1, Eq t) => t -> t1 -> [(t, t1)] -> [(t, t1)]
debitar n v [] = []
debitar n1 v ((n2, s):l)
	| n1 == n2 = (n2, s-v) : l
	| otherwise = (n2, s) : debitar n1 v l

existe :: (Eq t, Eq a) => a -> [(a,t)] -> Bool
existe numeroConta lista = (procurar numeroConta lista) /= [] 

cadastrar c lista = if (existe (fst c) lista) then lista else lista ++ [c] 




-- testes
type NumeroConta = String
type Saldo = Float
type Conta = (NumeroConta, Saldo)

banco = [("34004", 100),("1212", 99),("9876", 0),("1111", 9999)]
-- creditar "1212" 1 banco
banco1 = []
banco2 = cadastrar ("12-3",100) (cadastrar ("45-6",0) (cadastrar ("12-3",0) banco1))
conta1 = procurar "12-3" banco2
banco3 = creditar "12-3" 55 banco2
conta2 = procurar "12-3" banco3
banco4 = remover "45-6" banco3
tamanhoBanco = tamanho banco4


-- exercício: definir ++
myConcat :: [t] -> [t] -> [t]
myConcat l1 [] = l1
myConcat [] l2 = l2
myConcat (a:as) (b:bs) = a : myConcat as (b:bs) 

-- exercício: definir reverse

myReverse [] = []
myReverse (a:as) = myReverse as ++ [a]






