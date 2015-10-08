data OpBinario = Soma | Sub | Mult | Div
data OpUnario = Fatorial | Menos
-- data Exp = Literal Float | Unaria OpUnario Exp | Binaria Exp OpBinario Exp ====>>> definição antiga
data Exp t = Literal t | Unaria OpUnario (Exp t) | Binaria (Exp t) OpBinario (Exp t) -- o tipo de Exp passado como parâmetro


av Soma = (+)
av Sub = (-)
av Mult = (*)
av Div = (/)


avaliar :: Fractional a => Exp (t -> a) -> a
avaliar a (Literal n) = a n
avaliar a (Binaria e op f) = (av op) (avaliar a e) (avaliar a f)

--exemplos
{--
ex1 = avaliar (Binaria (Literal 3) Soma (Literal 2))
ex2 = avaliar (Literal 3)--}