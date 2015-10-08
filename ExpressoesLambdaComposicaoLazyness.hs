

-- Escopo estático e dinâmico... closure!
scope x y = g
	where g = x + y + w

-- Haskell vai usar as variáveis que ela conhece quando a função foi definida. Ou seja, haskell é uma linguagem de escpo estático.

-- exemplos:
res17 =  x + (scope 2 3) 3
	where x = 9
-- a definição where x = 9 não é considerada, pois na definição da função x já foi definido.


res20 = x + (scope 5 3) 3
	where x = 9
-- a definição where x = 9 não é considerada, pois na definição da função x já foi definido.
