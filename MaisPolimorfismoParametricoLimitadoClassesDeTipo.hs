-- Para termos o polimorfismo paramétrico limitado, temos que definir as restrições, 
-- ou as classes de tipos. Bem parecido com interfaces em Java.
--
-- Haskell já traz várias classes definidas, já que elas são usadas para definir
-- os tipos de vários operadores primitivos da linguagem. Veja a definição de 
-- algumas classes similares às pré-definidas em Haskell.

class Eqq t where 
	(===) :: t -> t -> Bool

class Showw a where
	showwsPrec :: Int -> a -> showwS 
	showw      :: a -> String
	showwList  :: [a] -> ShowS 	

-- Uma função que tem como parâmetro um tipo "a" que seja da classe Eqq (o que seria
-- representado como "Eqq a"), pode receber como argumento um elemento de qualquer 
-- tipo que tenha um operador "===" e tenha sido definido como uma instância de Eqq.
-- Depois veremos como definir instâncias de uma classe.
-- 
-- Função tem parâmetro do tipo Int, só recebe argumentos inteiros
-- Função tem parâmetro de tipo a qualquer, recebe argumento de qualquer tipo
-- Função tem parâmetro de tipo a que seja da classe Eqq, recebe argumento de qualquer 
--        tipo que seja instância de Eqq (consequentemente esse tipo tem um operador ===) 

 
-- São instâncias de Eq os tipos primitivos e as listas e tuplas de instâncias de Eq.
--
-- Mas e os novos tipos que definimos, como associamos às classes? 
-- E as novas classes, como associamos às instâncias (tipos) primitivas?
-- Se não associamos os novos tipos a Eq, não podemos usar ==
--
-- eqTypeError = Cons 5 Nil == Cons 6 Nil
-- No instance for (Eq (List t0)) arising from a use of `=='


-- Associação derivada, pode não ser o ideal, implicitamente define
-- operadores para um tipo existente.

data Liste t = Nile | Conse t (Liste t)
	deriving (Eq, Ord, Show)

eqTypeOK = Conse 5 Nile == Conse 6 Nile

instance Show Expressao where
	show = showExpressao

instance Show OpBinario where
	show Soma = " + "
	show Sub = " - "
	show Mul = " * "
	show Div = " / "

instance Show OpUnario where
	show Pos = "+"
	show Neg = "-"

instance Show t => Show (Expp t) where
    show (Litp t) = show t
    show (Unp op e) = show op ++ "(" ++ show e ++ ")"
    show (Binp e op f) =  "(" ++ show e ++ show op ++ show f ++ ")"




