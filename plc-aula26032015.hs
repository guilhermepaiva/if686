--polimorfismo
myZip :: [t] -> [u] -> [(t, u)]
myZip (a:as) (b:bs) = (a, b) : zip as bs
myZip _  _  = []

myLenght :: [t] -> Int
myLenght [] = 0
myLenght (a:as) = 1 + myLenght as



myTake :: [t] -> Int -> [t]
myTake _ 0 = []
myTake (a:as) n = a : myTake as (n - 1)

myDrop :: [t] -> Int -> [t]
myDrop [] _ = []
myDrop (a:as) 0 = a:as
myDrop (a:as) n = myDrop as (n - 1)

myTakeWhile :: (t -> Bool) -> [t] -> [t]
myTakeWhile _ [] = []
myTakeWhile f (a:as)
	| f a = a : myTakeWhile f as
	| otherwise = []