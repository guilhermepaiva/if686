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






