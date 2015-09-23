

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


creditar n v [] = []
creditar n1 v ((n2, s):l)
	| n1 == n2 = (n2, s+v) : l
	| otherwise = (n2, s) : creditar n1 v l


debitar n v [] = []
debitar n1 v ((n2, s):l)
	| n1 == n2 = (n2, s-v) : l
	| otherwise = (n2, s) : debitar n1 v l


-- testes
type NumeroConta = String
type Saldo = Float
type Conta = (NumeroConta, Saldo)

banco = [("34004", 100),("1212", 99),("9876", 0),("1111", 9999)]
-- creditar "1212" 1 banco
