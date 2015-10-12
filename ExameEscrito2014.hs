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
instance Eq Valor where
	(Num d) == (Num e) = d == e
	(Bool a) == (Bool b) = a == b
	Erro == Erro = True
	_ == _ = False
-- fim da segunda questao

-- terceira questao
data ExpB = V | F | NEG ExpB | OU ExpB ExpB | VarB Id | AplB Operador ExpI
data ExpI = Lit Int | VarI Id | Apl Operador ExpI

type Operador = String

-- comando: atribuicao, if-else, while e composicao sequencial de comandos
data Comando = Atr Id ExpI | If ExpB Comando Comando | While ExpB Comando | Seq Comando Comando

-- exemplo para a questao
-- x = 5; y = fat x; if (odd y) then z else z = y; while (>0 z) {x = +2 x; z = -10 z}
p1 = Seq (Atr "x" (Lit 5)) (Atr "y" (Apl "fat" (VarI "x")))
p2 = Seq p1 (If (AplB "odd" (VarI "y")) (Atr "z" (VarI "x")) (Atr "z" (VarI "y")))
p3 = Seq p2 (While (AplB ">0" (VarI "z")) (Seq (Atr "x" (Apl "+2" (VarI "x"))) (Atr "z" (Apl "m10" (VarI "z")))))
p4 = Seq p3 (Atr "w" (VarI "x"))

oddd (Num d) = Bool (odd d)
oddd _ = Erro

-- fim da terceira questao

-- quarta questao

intEB a V s = Bool True
intEB a F s = Bool False
intEB a (NEG e) s = nott (intEB a e s)
intEB a (OU e f) s = orr (intEB a e s) (intEB a f s)
intEB a (VarB i) s = lookupp i s
intEB a (AplB o e) s = apl (lookupp o a) (intEI a e s)

nott (Bool b) = Bool (not b)
nott _ = Erro

orr (Bool b) (Bool c) = Bool (b || c)
orr _ _ = Erro


intEI a (Lit d) s = Num d
intEI a (VarI i) s = lookupp i s
intEI a (Apl o e) s = apl (lookupp o a) (intEI a e s)


int a (Atr i e) s = let v = intEI a e s in (v,overwrite (i,v) s)
int a (If c c1 c2) s | (intEB a c s) == (Bool True) = int a c1 s
                     | (intEB a c s) == (Bool False) = int a c2 s
                     | otherwise = (Erro,s)
int a (While c c1) s | (intEB a c s) == (Bool True) = let (v,s1) = int a c1 s in int a (While c c1) s1 
                     | (intEB a c s) == (Bool False) = (Num 0,s) 
                     | otherwise = (Erro,s)
int a (Seq c1 c2) s = int a c2 s1
                      where (v,s1) = int a c1 s

-- testes
amb = [("fat",Fun fat),("odd",Fun oddd),(">0",Fun m0),("+2",Fun m2),("m10",Fun m10)]
res = int amb p4 []
resv = fst res
ress = snd res


--fim da quarta quesao


