--tipos algébricos

data Estacao = Inverno | Verao | Outono | Primavera
data Temp = Frio | Quente

--funções que usam casamento de padrões
clima :: Estacao -> Temp
clima Inverno = Frio
clima _ = Quente

type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade

showPerson :: Pessoas -> String
showPerson (Pessoa n a) = n ++ " -- " ++ show a

--construtores com argumentos
data Shape = Circle Float | Rectangle Float Float

isRound :: Shape -> Bool
isRound (Circle _) = True
isRound (Rectangle _ _) = False

area :: Shape -> Float
area (Circle x) = 3.14*x*x
area (Rectangle x y) = x*y

data DayOfWeek = Segunda Int [String] | Terca Int [String] | Quarta Int [String] | Quinta Int [String] | Sexta Int [String] | Sabado | Domingo

isWeekend :: DayOfWeek -> Bool
isWeekend Sabado = True
isWeekend Domingo = True
isWeekend _ = False

hasPLCClass :: DayOfWeek -> Bool
hasPLCClass Sabado = False
hasPLCClass Domingo = False
hasPLCClass (Segunda a b) = ["PLC"] == [x | x <- b, x == "PLC"]
hasPLCClass (Terca a b) = ["PLC"] == [x | x <- b, x == "PLC"]
hasPLCClass (Quarta a b) = ["PLC"] == [x | x <- b, x == "PLC"]
hasPLCClass (Quinta a b) = ["PLC"] == [x | x <- b, x == "PLC"]
hasPLCClass (Sexta a b) = ["PLC"] == [x | x <- b, x == "PLC"]

--tipos de dados recursivos
data Expr = Lit Int | Add Expr Expr | Sub Expr Expr
	deriving (Show)

--funções definidas recursivamente
eval :: Expr -> Int
eval (Lit n) = n
eval (Add e1 e2) = (eval e1) + (eval e2)
eval (Sub e1 e2) = (eval e1) - (eval e2)


--listas 
data List t = Nil | Cons t (List t)
	deriving (Show)

data Tree t = NilT | Node t (Tree t) (Tree t)
	deriving (Eq, Show)

--exercicios do final dos slides
showExpr :: Expr -> String
showExpr (Lit a) = show (a)
showExpr (Add a b) = show(a) ++ " + " ++ show(b)
showExpr (Sub a b) = show(a) ++ " - " ++ show(b)

toList :: List t -> [t]
toList (Nil) = []
toList (Cons a as) = a:toList(as)
--toList (Cons 1 (Cons 2 (Cons 3 Nil)))

fromList :: [t] -> List t
fromList [] = Nil
fromList (a:as) = Cons a (fromList as)

depth :: Tree t -> Int
depth (NilT) = 0
depth (Node a b c) = 1 + (max (depth b) (depth c))

collapse :: Tree t -> [t]
collapse NilT = []
collapse (Node a b c) = [a] ++ collapse b ++ collapse c

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree f NilT = NilT
mapTree f (Node a b c) = Node (f a) (mapTree f b) (mapTree f c)





