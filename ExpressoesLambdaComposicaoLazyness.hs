-- relembrando foldr
testeFoldr = foldr (+) 5 [1,2,3]

-- na funcão de calcular média da aula anterior, a lista é varrida duas vezes. neste caso abaixo, a lista só é varrida uma vez.
mediaaux s t [] = s / t
mediaaux s t (a:as) = mediaaux (s+a) (t+1) as 

mediao l = mediaaux 0 0 l

-- funções também podem ser representadas por expressões lambda. Valor que denota uma funcão anônima.
sizefrpl = foldr (\x y -> 1 + y) 0

{--
avaliação lazy, só avalia o que for necessário para a execução da funcão. Normalmente, em outras linguagens, a avaliação é estrita (não lazy)
e da esquerda para a direira.
--}
lazy :: (Ord a, Num a) => a -> a -> a
lazy x y 
	| x > 0 = x
	| otherwise = y

loop :: t -> t1
loop x = loop x

-- testes para analisar o comportamento da avaliação lazy
res5 = lazy 5 (loop 1) -- não avalia nem o loop 1
resloop1 = lazy (loop 1) 5 -- entra em loop infinito
resloop2 = lazy 0 (loop 1) -- entra em loop infinito, pois avalia a primeira condição e passa para a segunda condição.

llazy [] = []
llazy (e:l) 
	| e > 0 = [e]
	| otherwise = llazy l

res1 = llazy [-100..]

-- exercício

avaliar (x, '+', y) = x + y
avaliar (x, '-', y) = x - y
avaliar (x, '*', y) = x * y
avaliar (x, '/', y) = x / y

{-- testes
*Main> avaliar (2, '+', 3)
5.0
*Main> avaliar (2, '-', 3)
-1.0
*Main> avaliar (2, '*', 3)
6.0
*Main> avaliar (2, '/', 3)
0.6666666666666666
--}

avOp '+' = (+)
avOp '-' = (-)
avOp '*' = (*)
avOp '/' = (/)

av (x, op, y) = avOp op x y

-- teste: av (2 '+', 3)

avaliarExpressoes [] = []
avaliarExpressoes (a:as) = avaliar a : avaliarExpressoes as

-- teste: avaliarExpressoes [(2, '+', 3), (4, '*', 3)]


filtraDivisaoPorZero :: (Num t1, Eq t1) => [(t, Char, t1)] -> [(t, Char, t1)]
filtraDivisaoPorZero [] = []
filtraDivisaoPorZero ((a, '/', 0) : as) = filtraDivisaoPorZero as
filtraDivisaoPorZero (a:as) = a : filtraDivisaoPorZero as

{--
*Main> filtraDivisaoPorZero [(2, '/', 3), (2, '/', 0), (3, '/', 1)]
[(2,'/',3),(3,'/',1)]
--} 

somaTotal :: (Fractional t1, Eq t1) => [(t1, Char, t1)] -> t1 
somaTotal l = sum (avaliarExpressoes (filtraDivisaoPorZero l))

listaTesteExpressoes = [(6, '/', 3), (2, '/', 0), (3, '-', 1)]

testeSomaTotal = somaTotal listaTesteExpressoes



-- Escopo estático e dinâmico... closure!
scope x y = g
	where g w = x + y + w



-- Haskell vai usar as variáveis que ela conhece quando a função foi definida. Ou seja, haskell é uma linguagem de escopo estático.

-- exemplos:
res17 =  x + (scope 2 3) 3
	where x = 9
-- a definição where x = 9 não é considerada, pois na definição da função x já foi definido.


res20 = x + (scope 5 3) 3
	where x = 9
-- a definição where x = 9 não é considerada, pois na definição da função x já foi definido.


