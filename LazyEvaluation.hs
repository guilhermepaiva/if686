lazy x y 
	| x > 0 = x
	| otherwise = y

{--
Haskell só avalia quando necessário. Em outras linguagens (que não são preguiçosas), elas avaliam (f 2) e (f 17).
Como Haskkell é preguiçosa, no caso acima, ela só avalia o (f 2)
--}

-- TODO fazer fat n
fat 0 = 1
fat n = n * fat (n-1)

lazy (fat 2) (fat 17) = fat 2 = 2

um x = 1
um (lazy 0 (fat 17)) = 1 -- nem avalia o que está dentro de um

loop x = loop x
lazy (fat 2) (loop 5) = (fat 2) = 2 -- em linguagens não preguiçosas, entraria em loop. No caso de haskell, ela nunca avalia (loop 5) neste caso.


