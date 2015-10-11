import Data.Char

myGetChar :: ([a], t) -> (a, ([a], t))
myGetChar (entrada, saida) = (head entrada, (tail entrada, saida))

{--
testes
*Main> myGetChar (['a', 'b', 'c'], 1)
('a',("bc",1))
--}

myPutChar :: a -> (t, [a]) -> (t, [a])
myPutChar caractere (entrada, saida) = (entrada, saida ++ [caractere])

{--
exemplo simples que lê dois caracteres e dois soma esses dois caracteres [deu erro pq somac está definido em outro arquivo]
--}
m io = myPutChar (somac valor1, valor2) io2
	where 
		(valor1, io1) = myGetChar io
		(valor2, io2) = myGetChar io2

-- Função soma simplificada, obviamente, para fazer a função funcionar
somac :: Char -> Char -> Char   
somac c1 c2 = '5'


-- graças a Monads, na prática, em haskell é feito assim
m1 = do 
	c1 <- getChar
	putChar '+' 
	c2 <- getChar
	putChar '='
	putChar (somac c1 c2)

--essa definição acima, na verdade, é uma abreviacão para a função abaixo
m2 = do
	getChar >>= (\c1 ->
		getChar >>= (\c2 ->
			putChar (somac c1 c2)))

-- graças a Monads, em haskell, na prática é feito assim
mmm = do c1 <- getChar 
         c2 <- getChar
         putChar (somac c1 c2)

-- getChar :: IO Char
-- putChar :: Char -> IO ()
-- getLine :: IO String
-- putStr :: String -> IO ()
-- putStrLn :: String -> IO ()

-- usando uma notação especial, para o código acima.
m4 = do getChar >>= (\c1 -> 
		getChar >>= (\c2 -> 
		putChar (somac c1 c2)))

t4 = do 
	c <- getChar
	putChar c
	return (c == 'y')


readChars 0 = return ()
readChars n = do
	c <- getChar
	putChar c
	putChar '\n'
	readChars (n-1)	

{-- teste
*Main> readChars 5
aa
cc
vv
aa
dd
*Main> 
--}

sumChars l 0 = return ((sum . map (\c -> ord c)) l)
sumChars l n = do
	c <- getChar
	putChar '\n'
	sumChars (l ++ [c]) (n-1) 








