-- o tipo Maybe
import Data.Maybe

safeDiv :: Integral t => t -> t -> Maybe t
safeDiv x y
	| y /= 0 = Just (x `div` y)
	| otherwise = Nothing

newSafeDiv :: Integral t => Maybe t -> Maybe t -> Maybe t
newSafeDiv _ Nothing = Nothing
newSafeDiv Nothing _ = Nothing
newSafeDiv (Just x) (Just y)
	| y /= 0 = Just (x `div` y)
	| otherwise = Nothing

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (a:as) = Just as

-- Maybe é um Monad: computação que leva em conta o contexto, que pode ser encadeada com outras através do operador de ligação (>>=)
-- ex.: Just 3 >>= (\x -> Just $ show x ++ "!") = Just "3!"
-- ex.: Just 3 >>= (\x -> Just $ show x ++ "!") >>= (\y -> Just $ map (\z -> [z]) y) = Just ["3", "!"]
-- ex.: Just 33 >>= \x -> safeDiv 10000 x >>= (\y -> Just $ show y) >>= safeTail = Just "03"


-- exercícios

data Failable t = Error String | Success t
	deriving (Show)

data Fila t = Node t Int (Fila t) | Nil
	deriving (Show)

instance Monad Failable where
	(>>=) (Error x) _ = Error x
	(>>=) (Success x) f = f x
	return x = Success x

criarFila :: Int -> t -> Failable (t, Fila t)
criarFila size first
	| size < 1 = Error "Too Smal buddy"
	| otherwise = Success (first, Node first size (Nil))

push' :: t -> Fila t -> Fila t
push' el (Node head size Nil) = Node head size (Node el (size-1) Nil)
push' el (Node head size tail) = Node head size (push' el tail)

getSize :: Fila t -> Int
getSize Nil = 0
getSize (Node _ _ next) = 1 + getSize(next)

push :: t -> Fila t -> Failable (t, Fila t)
push el (Node head size tail)
	| size > getSize (Node head size tail) = Success (el, (push' el (Node head size tail)))
	| otherwise = Error "Queue is just full"





