

myFoldr op id [] = id
myFfoldr op id (x:xs) =
	op x (myFoldr op id xs)

--f x (soma, total) = (soma+x, t+1) 

{--media :: Fractional a => a -> a -> [a] -> a
media soma total [] = soma / total
media soma total (x:xs) = 
	media (soma + x) (total + 1) xs
--}

{-- media [] = 0
media l = s/t
	where (s, t) = foldr (\x (s, t) -> (s+x, t+1))
--}

soma lista = foldr (+) 0 lista

{--
	Composição de funções: 
	(.) f g x = f (g x) --- tipo da função: (b -> c) -> (a -> b) -> a -> c
	ou pode ser defindo como:
	(x) f g = (\x -> f (g x))
--}

-- exemplos de composição de funções

incrementa x = x + 1

decrementa x = x - 1

testeComposicao = (incrementa.decrementa) 3
{-- 
Como funciona:
(incrementa.decrementa) 3 = (incrementa(decrementa 3)) = (incrementa 2) = 3
--}

-- Map com compreensão de conjuntos. Fica mais claro que todos os elementos da lista serão tranformados pela função f.
mapc :: (t1 -> t) -> [t1] -> [t]
mapc f l = [f e | e <- l]

-- agora vamos selecionar somente os aprovados. precisamos fazer algo na lista, e map é perfeito pra isso.

aprovadosr [] = []
aprovadosr ((nome, nota) : l)
	| nota >= 7 = (nome) : aprovadosr l
	| otherwise = aprovadosr l

--entrada teste
turma = [("Pedro", 9),("Mariana",7 ),("Paulo",5 ),("Clarissa", 6)]
testeAprovados = aprovadosr turma





















