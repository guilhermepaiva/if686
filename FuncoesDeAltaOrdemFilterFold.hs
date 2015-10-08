

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
aprovadosr :: (Ord a, Num a) => [(t, a)] -> [t] 
aprovadosr [] = []
aprovadosr ((nome, nota) : l)
	| nota >= 7 = (nome) : aprovadosr l
	| otherwise = aprovadosr l

--entrada teste
turma = [("Pedro", 9),("Mariana",7 ),("Paulo",5 ),("Clarissa", 6)]
testeAprovados1 = aprovadosr turma

-- a mesma ideia, mas usando compreensão de listas
aprovadosListComprehension :: (Ord a, Num a) => [(t, a)] -> [t] 
aprovadosListComprehension l = [nome | (nome, nota) <- l, nota >= 7]

testeAprovados2 = aprovadosListComprehension turma

-- da mesma forma para reprovados
reprovadosr [] = []
reprovadosr ((nome, nota) : l)
	| nota < 7 = (nome) : reprovadosr l
	| otherwise = reprovadosr l

testeReprovados1 = reprovadosr turma

--usando list comprehension
reprovadosListComprehension l = [nome | (nome, nota) <- l, nota < 7]

testeReprovados2 = reprovadosListComprehension turma

-- nos dois casos acima estamos filtrando elementos de uma lista com base na nota. o que muda apenas é o filtro, a função, o predicado, de seleção dos elementos
mfilter :: (t -> Bool) -> [t] -> [t]
mfilter f l = [x | x <- l, (f x)]

mfilterr :: (t -> Bool) -> [t] -> [t]
mfilterr f [] = []
mfilterr f (a:as)
	| f a = a : mfilterr f as
	| otherwise = mfilterr f as

-- agora como calculamos a média da turma? assumindo que com o map conseguimos facilmente pegar as notas.
getNotas :: [(t, t1)] -> [t1]
getNotas l = map snd l -- pega somente as notas da turma

somaNotas :: (Num a) => [a] -> a
somaNotas [] = 0
somaNotas (a:as) = a + somaNotas as

-- teste
somaDasNotas = somaNotas (getNotas turma)

tamanhoTurma :: (Num a) => [t] -> a
tamanhoTurma [] = 0
tamanhoTurma (a:as) = 1 + tamanhoTurma as

mediaTurma :: (Fractional a) => [(t, a)] -> a
mediaTurma l = somaNotas (getNotas l) / tamanhoTurma l

--teste
testeMediaTurma = mediaTurma turma

-- fold tranforma lista em números a partir de um operador como parâmetro
fold :: (Num a) => (t -> a -> a) -> [t] -> a
fold op [] = 0
fold op (a:as) = op a (fold op as)

-- dá pra generalizar o fold para uma lista de qq coisa
foldrr :: (t1 -> t -> t1 -> t1) -> t1 -> [t] -> t1
foldrr op i [] = i
foldrr op i (a:as) = op i a (foldrr op i as)

somaFoldr l = foldr (+) 0 l

-- mais operações usando foldr
separador :: [Char] -> [Char] -> [Char]
separador x y = x ++ "; " ++ y

nomess l = foldr separador "" l

nomessTeste = nomess (map fst turma)






















