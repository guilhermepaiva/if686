-- primeira questao

data Valor = Num Int | Bool Bool | Erro | Fun (Valor -> Valor)

-- defina em haskell as funções a seguir que trabalham com ambientes e memórias de interpretadores como:
-- [("fat", Fun fatorial), (">0", Fun maior0), ("+2", Fun adiciona2)]

type Id = String

instance Show Valor where
	show (Num n) = show n
	show (Bool b) = show b
	show Erro = "Erro" 
	show (Fun f) = "Fun def"

-- definção das funções
fat (Num d) = Num (fatorial d)
fat _ = Erro

fatorial 0 = 1
fatorial n = n * (fatorial (n-1))

m0 (Num n) = Bool (n > 0)
m0 _ = Erro

m2 (Num n) = Num (n + 2)
m2 _ = Erro

m10 (Num n) = Num (n-10)
m10 _ = Erro

-- resposta do item 1.
overwrite :: Eq a => (a, t) -> [(a, t)] -> [(a, t)]
overwrite (i, v) [] = [(i, v)]
overwrite (i, v) ((j,u):l) = if (i == j) then (j,v):l else [(j, u)] ++  (overwrite (i, v) l)

-- resposta do item 2.
lookupp :: Eq a => a -> [(a, Valor)] -> Valor
lookupp i [] = Bool False
lookupp i ((j, u):l) = if (i == j) then u else lookupp i l

-- testes
meuambiente = [("fat", Fun fat), (">0", Fun m0), ("+2", Fun m2)]

testeLookupp1 = lookupp "+7" meuambiente
testeLookupp2 = lookupp "fat" meuambiente
testeLookupp3 = lookupp ">0" meuambiente
testeLookupp4 = lookupp "+2" meuambiente
testeLookupp5 = lookupp "++++" meuambiente 


testeOverrite1 = overwrite ("+10", Fun m10) meuambiente

apl :: Valor -> Valor -> Valor
apl (Fun f) v = f v
apl _ _ = Erro

-- fim da primeira questao

-- segunda questao


