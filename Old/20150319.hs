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


--algoritmo heapsort
swap :: Int -> Int -> [Int] -> [Int]
swap i j xs | i == j    = xs
            | i < j     = (take i xs) ++ ((xs!!j):[]) ++ (drop (i+1) (take j xs)) ++ ((xs!!i):[]) ++ (drop (j+1) xs)
            | otherwise = (take j xs) ++ ((xs!!i):[]) ++ (drop (j+1) (take i xs)) ++ ((xs!!j):[]) ++ (drop (i+1) xs)

large :: Int -> Int -> [Int] -> Int
large i l xs = if ((2*i+1) < l) && ((xs!!(2*i+1)) > (xs!!i))
               then (2*i+1)
               else i

largest :: Int -> Int -> [Int] -> Int
largest i l xs = if ((2*i+2) < l) && ((xs!!(2*i+2)) > (xs!!(large i l xs)))
                 then (2*i+2)
                 else large i l xs

heapify :: Int -> Int -> [Int] -> [Int]
heapify i l xs = if ((largest i l xs) /= i)
                 then heapify (largest i l xs) l (swap (largest i l xs) i xs)
                 else xs

buildHeap :: Int -> [Int] -> [Int]
buildHeap i xs | i <= 0    = heapify 0 (length xs) xs
               | otherwise = buildHeap (i-1) (heapify i (length xs) xs)

hpsort :: Int -> [Int] -> [Int]
hpsort i xs = if (i == 1)
              then heapify 0 i (swap 0 i xs)
              else hpsort (i-1) (heapify 0 i (swap 0 i xs))

heapsort :: [Int] -> [Int]
heapsort xs | (length xs) <= 1 = xs
heapsort xs = hpsort ((length xs)-1) (buildHeap (div (length xs) 2) xs)