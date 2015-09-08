main :: IO ()
main = putStr "Digite seu nome: " >> getLine >>= \s -> putStr "O contrario de: " >> putStr (reverse s) >> putStr "\n"