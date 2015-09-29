import Data.Char

myGetChar :: ([a], t) -> (a, ([a], t))
myGetChar (entrada, saida) = (head entrada, (tail entrada, saida))

myPutChar :: a -> (t, [a]) -> (t, [a])
myPutChar caractere (entrada, saida) = (entrada, saida ++ [caractere])