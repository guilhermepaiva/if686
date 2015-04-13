--exercicios da aula 02 de PLC

addPair :: (Int, Int) -> Int
addPair (x, y) = x + y

shift :: ((Int, Int), Int) -> (Int, (Int, Int))
shift ((x,y), z) = (x, (y, z)) 

--sinônimos de tipos
type Name = String
type Age = Int
type Phone = Int
type Person = (Name, Age, Phone)

name :: Person -> Name
name (n, a, p) = n

--equação do segundo grau
oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b/(2.0*a)

twoRoots :: Float -> Float -> Float -> (Float, Float)
twoRoots a b c = (d-e, d+e)
	where
		d = -b/(2.0*a)
		e = sqrt(b^2-4.0*a*c)/(2.0*a)

roots :: (Float, Float, Float) -> String
roots (a, b, c)
	| b^2-4.0*a*c == 0 = show (oneRoot a b c)
	| b^2 > 4.0*a*c = show f ++ " " ++ show s
	| otherwise = "no roots"
		where
			f = fst (twoRoots a b c)
			s = snd (twoRoots a b c)


menor :: Int -> Int -> Int
menor a b
	| a < b = a
	| otherwise = b

maior :: Int -> Int -> Int
maior a b
	| a > b = a
	| otherwise = b

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c
	| a < menor b c = (a, menor b c)
	| b < menor a c = (b, menor a c)
	| c < menor a b = (c, menor a b)
	| otherwise = (menor a b, menor b c)

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a, b, c)
	| a <= menor b c = (a, menor b c, maior b c)
	| b <= menor a c = (b, menor a c, maior a c)
	| c <= menor a b = (c, menor a b, maior a b)

 
type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

primeiraCoordenadaPonto :: Ponto -> Float
primeiraCoordenadaPonto (a, b) = a

segundaCoordenadaPonto :: Ponto -> Float
segundaCoordenadaPonto (a, b) = b

retaVertical :: Reta -> Bool
retaVertical ((x1, y1), (x2, y2))
	| x1 == x2 = True
	| otherwise = False

pontoY :: Float -> Reta -> Float
pontoY x ((x1, y1),(x2, y2))
	| retaVertical ((x1, y1),(x2, y2)) = error "A reta eh vertical"
	| otherwise = ((y2 - y1)/(x2 - x1)) * (x - x1) + y1













