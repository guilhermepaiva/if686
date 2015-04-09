--tipos enumerados

-- inverno, verao, outono e primavera são valores possíveis para a variável Estacao
data Estacao = Inverno | Verao | Outono | Primavera
data Temperatura = Quente | Frio

--funções usam casamento de padrões
clima :: Estacao -> Temperatura
clima Inverno = Frio
clima _ = Quente

data Color = Red | Green | Blue

colorEq :: Color -> Color -> Bool
colorEq Red	Red	=	True
colorEq Blue	Blue	= True
colorEq	Green	Green	=	True
colorEq	_	_	=	False

data Shape = Circle Float | Rectangle Float Float

isRound :: Shape -> Bool
isRound (Circle _) = True
isRound (Rectangle _ _) = False