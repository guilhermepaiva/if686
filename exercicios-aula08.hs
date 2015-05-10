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