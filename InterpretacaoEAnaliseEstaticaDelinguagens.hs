{-- Para interpretar programas, precisamos representá-los de forma
abstrata, como uma árvore resultante do processo de parsing. Para
representar os programas de uma linguagem funcional simples,  temos o seguinte.
--}

type Id = String
type Numero = Double

data TermoLinFun = Identifier Id | Literal Numero | Lambda Id TermoLinFun | Aplicacao TermoLinFun TermoLinFun
data Definicao = Def Id TermoLinFun

type Programa = [Definicao]

-- por exemplo, o programa abaixo seria interpretado como segue.
-- def inc = (lambda x . + x 1); def v = + 3 2; def resultado = inc v 

-- testes
def1 = Def "inc" (Lambda "x" (Aplicacao (Aplicacao (Identifier "+") (Identifier "x")) (Literal 1))) 
def2 = Def "v" (Aplicacao (Aplicacao (Identifier "+") (Literal 3)) (Literal 2)) 
def3 = Def "resultado" (Aplicacao (Identifier "inc") (Identifier "v"))

prog1 = [def1, def2, def3]

-- o resultado da interpretação seria um dos seguintes, já que a linguagem manipula apenas números e funções
data ValorFun = Numero Double | Funcao (ValorFun -> ValorFun) | Excecao

instance Show ValorFun where
	show (Numero n) = show n
	show (Funcao f) = "Definicao da funcao nao pode ser impressa!"
	show (Excecao) = "Excecao durante a execucao do interpretador"

-- A função que implementa o interpretador dos termos precisa receber como parâmetro um
-- ambiente, contendo as funções pré-definidas, e as definidas pelo programador.

type Ambiente = [(Id, ValorFun)]

-- no nosso caso o ambiente teria apenas a definição de "+".

-- teste
ambienteSimples = [("+",Funcao (\x -> (Funcao (\y -> somaValorFun x y))))]

somaValorFun (Numero x) (Numero y) = Numero (x+y)
somaValorFun _ _ = Excecao

