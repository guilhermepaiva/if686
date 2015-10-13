-- questao 1

type Chave = String
type Valor = Int

add :: (Chave, Valor) -> [(Chave, Valor)] -> [(Chave, Valor)]
add (c, v) [] = [(c, v)]
add (c, v) ((cc, vv):l) = (c, v) : [b | b <- ((cc, vv):l), cc /= c]

domain :: [(Chave, Valor)] -> [Chave]
domain [] = []
domain ((c, v):l) = c : domain l

-- teste: [("teste",12),("as",34),("teste",98),("aaa",89),("mnm",76)]

image :: [(Chave, Valor)] -> [Valor]
image [] = []
image ((c, v):l) = v : image l

apply :: Chave -> [(Chave, Valor)] -> Maybe Valor
apply c [] = Nothing
apply c ((cc, vv):l) = if c == cc then Just vv else apply c l

domainListComprehension :: [(Chave, Valor)] -> [Chave]
domainListComprehension [] = []
domainListComprehension ((c, v):l) = [fst i | i <- ((c, v):l)]

imageListComprehension [] = []
imageListComprehension ((c, v):l) = [snd i | i <- ((c, v):l)]

-- fim da questao 1

-- questao 2
