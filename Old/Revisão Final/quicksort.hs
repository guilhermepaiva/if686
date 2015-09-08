quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (pivot:rest) = quicksort [y | y <- rest, y < pivot] ++ [pivot] ++ [y | y <- rest, y >= pivot]