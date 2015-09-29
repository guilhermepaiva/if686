import Data.Char

myGetChar :: ([a], t) -> (a, ([a], t))
myGetChar (entrada, saida) = (head entrada, (tail entrada, saida))

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
mmm = do 
	c1 <- getChar
	putChar '+' 
	c2 <- getChar
	putChar '='
	putChar (somac c1 c2)

--essa definição acima, na verdade, é uma abreviacão para a função abaixo
mmmm = do
	getChar >>= (\c1 ->
		getChar >>= (\c2 ->
			putChar (somac c1 c2)))