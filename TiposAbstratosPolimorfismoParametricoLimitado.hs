data OpBinario = Soma | Sub | Mult | Div
data OpUnario = Fatorial | Menos
data Exp = Literal Float | Unaria OpUnario Exp | Binaria Exp OpBinario Exp


av Soma = (+)
av Sub = (-)
av Mult = (*)
av Div = (/)

avaliar :: Exp -> Float
avaliar (Literal n) = n
avaliar (Binaria e op f) = (av op) (avaliar e) (avaliar f)

--exemplos
ex1 = avaliar (Binaria (Literal 3) Soma (Literal 2))
ex2 = avaliar (Literal 3)