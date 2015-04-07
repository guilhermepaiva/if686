--algoritmo mergesort

merge :: [Int] -> [Int] -> [Int]
merge left right 
	| left == []	= right
	| right == []	= left
	| head left <= head right	= (head left):(merge (tail left) right)
	| otherwise	= (head right):(merge left (tail right))

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort(fst (splitAt ((length xs) `div` 2) xs))) (mergeSort(snd (splitAt ((length xs) `div` 2) xs)))