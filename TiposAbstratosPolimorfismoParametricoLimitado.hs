type Operador = Char
data Expressao = Numero Float | Unaria Operador Expressao | Binaria Expressao Operador Expressao

avOp :: Fractional a => Char -> a -> a -> a
avOp '+' = (+)
avOp '-' = (-)
avOp '*' = (*)
avOp '/' = (/)

avaliard :: Expressao -> Float
avaliard (Numero f) = f
avaliard (Binaria e1 op e2) = avOp op (avaliard e1) (avaliard e2)
avaliard (Unaria op e)
	| op == '-' = -(avaliard e)
	| op == '+' = avaliard e

-- testes
exp1 = (Numero 3)
exp2 = (Binaria (Numero 3) '+' (Numero 2))
exp3 = (Unaria '-' (Numero 3))
exp4 = (Unaria '+' (Numero 9))
exp5 = Binaria (Numero 4) '+' (Binaria (Numero 6) '/' (Numero 2))

resexp1 = avaliard exp1
resexp2 = avaliard exp2
resexp3 = avaliard exp3
resexp4 = avaliard exp4
resexp5 = avaliard exp5


showExpressao :: Expressao -> String
showExpressao (Numero f) = show f
showExpressao (Binaria e1 op e2) = "(" ++ (showExpressao e1) ++ (showOp op) ++ (showExpressao e2) ++ ")"
showExpressao (Unaria op e) = (showOp op) ++ (showExpressao e)

showOp '+' = " + "
showOp '-' = " - "
showOp '*' = " * "
showOp '/' = " / "

-- testes
showExp1 = showExpressao exp1
showExp2 = showExpressao exp2
showExp3 = showExpressao exp3
showExp4 = showExpressao exp4
showExp5 = showExpressao exp5


-- Os construtores de tipo são vistos como funções que constroem elementos do tipo.
-- Numero :: Float -> Expressao
-- Binaria :: Expressao -> Operador -> Expressao -> Expressao
-- Unaria :: Operador -> Expressao -> Expressao

-- Melhorando com datatype para operador. Reduz a quantidade de elementos do tipo criado.
-- Deixa de fora elementos como "Binaria (Numero 5.1) ';' (Numero 5.2)", que não tinham
-- significado para o problema em questão, mas mesmo assim faziam parte do conjunto de 
-- elementos do tipo. Em particular, a função avaliard não estava definida para todos os
-- elementos do seu tipo. O que aconteceria se a expressão binária acima fosse passada como
-- parâmetro? Agora poderia-se garantir que todos os casos estão sendo cobertos... Deixa 
-- de fora vários caracteres que não representavam operadores. Diminui a quantidade de 
-- elementos do tipo; deixa só os representativos.

data OpBinario = Soma | Sub | Mul | Div
data OpUnario = Pos | Neg
data Exp = Literal Float | Un OpUnario Exp | Bin Exp OpBinario Exp

-- Tipo definido pode ser polimórfico, parametrizado por tipo dos elementos literais.
-- Expp funciona então como um gerador de tipos; para cada tipo passado como parâmetro
-- para Expp, temos um novo tipo.

data Expp t = Litp t | Unp OpUnario (Expp t) | Binp (Expp t) OpBinario (Expp t)

type ExpInt = Expp Int 
type ExpStr = Expp String
type ExpFloat = Expp Float

-- testes
exps = (Litp "4")
expf = (Litp 4.0)

-- Litp :: t -> Expp t
-- Unp :: OpUnario -> Expp t -> Expp t
-- Binp :: Expp t -> OpBinario -> Expp t -> Expp t

{--
a função de avaliação precisa então receber como parâmetro uma função que sabe tranformar os literais em valores,
um avaliador de literais; já que agora conseguimos trabalhar com literais de diferentes tipos. 
--} 

eval lit (Litp f) = lit f
eval lit (Binp e1 op e2) = evBOp op (eval lit e1) (eval lit e2)
eval lit (Unp Pos e) = eval lit e
eval lit (Unp Neg e) = -(eval lit e)

evBOp Soma = (+)
evBOp Sub = (-)
evBOp Mul = (*)
evBOp Div = (/)

-- testes
testeExp1 = Binp (Litp 5) Soma (Binp (Litp 6) Div (Litp 2))
resTesteExp1 = eval (\x -> x) testeExp1

testeExp2 = Binp (Litp "6") Soma (Binp (Litp "6") Div (Litp "2"))
resTesteExp2 = eval (\x -> (read x)) testeExp2





























