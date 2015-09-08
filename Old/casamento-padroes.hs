--casamento de padroes
myNot :: Bool -> Bool
myNot True = False
myNot False = True

myOr :: Bool -> Bool -> Bool
myOr True x = True
myOr False x = x

myAnd :: Bool -> Bool
myAnd True x = x
myAnd False x = False

