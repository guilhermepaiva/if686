type Operador = Char
data Expressao = Numero Float | Unaria Operador Expressao | Binaria Expressao Operador Expressao

avOp :: Fractional a => Char -> a -> a -> a
avOp '+' = (+)
avOp '-' = (-)
avOp '*' = (*)
avOp '/' = (/)

avaliard :: Expressao -> Float
avaliard (Numero f) = f
avaliard (Binaria e1 op e2) = avOp op (avaliard e1) (avaliard e2)
avaliard (Unaria op e)
	| op == '-' = -(avaliard e)
	| op == '+' = avaliard e

-- testes
exp1 = (Numero 3)
exp2 = (Binaria (Numero 3) '+' (Numero 2))
exp3 = (Unaria '-' (Numero 3))
exp4 = (Unaria '+' (Numero 9))
exp5 = Binaria (Numero 4) '+' (Binaria (Numero 6) '/' (Numero 2))

resexp1 = avaliard exp1
resexp2 = avaliard exp2
resexp3 = avaliard exp3
resexp4 = avaliard exp4
resexp5 = avaliard exp5



showExpressao (Numero f) = show f
showExpressao (Binaria e1 op e2) = "(" ++ (showExpressao e1) ++ (showOp op) ++ (showExpressao e2) ++ ")"
showExpressao (Unaria op e) = (showOp op) ++ (showExpressao e)

showOp '+' = " + "
showOp '-' = " - "
showOp '*' = " * "
showOp '/' = " / "

-- testes
showExp1 = showExpressao exp1
showExp2 = showExpressao exp2
showExp3 = showExpressao exp3
showExp4 = showExpressao exp4
showExp5 = showExpressao exp5
