--tipo para representar a tabela hash
type HashTable = [(Integer, String)]

mySample = [(1, "Sushi"), (2, "Macarronada"), (3, "Feijoada"), (4, "Lasanha"), (5,"Big Mac"), (6,"Risoto")]

get :: HashTable -> Integer -> String
get [] _ = "Nops"
get ((hashKey, hashValue):as) theKey
	| hashKey == theKey = hashValue
	| otherwise = get as theKey

put :: HashTable -> Integer -> String -> HashTable
put as hashKey hashValue
	| ((get as hashKey) == "Nops") = (hashKey, hashValue):as
	| otherwise = as ++ [(hashKey, hashValue)]

remove :: HashTable -> Integer -> HashTable
remove [] _ = []
remove ((hashKey, hashElement):as) myKey
	| hashKey == myKey = remove as myKey
	| otherwise = (hashKey, hashElement):remove as myKey

hasKey :: HashTable -> Integer -> Bool
hasKey as hashKey
	| get as hashKey == "Nops" = False
	| otherwise = True

member :: (Eq a) => a -> [a] -> Bool
member _ [] = False
member n (x:xs)
	| n == x = True
	| otherwise = member n xs

union :: (Eq a) => [a] -> [a] -> [a]
union xs [] = xs
union [] ys = ys
union (x:xs) ys
	| (member x ys) = union xs ys
	| otherwise = union xs $ [x] ++ ys 

intersection :: (Eq a) => [a] -> [a] -> [a]
intersection xs ys = [element | element <- union xs ys, member element xs, member element ys]

difference :: (Eq a) => [a] -> [a] -> [a]
difference xs ys = [element | element <- (intersection xs xs), not $ member element ys]

comparaConjuntos :: (Eq a) => [a] -> [a] -> String
comparaConjuntos set1 set2 
	| ((intersection set1 set2) == []) = "Conjutos Disjuntos"
	| (set1 == set2) = "A igual a B"
	| (not ((intersection set1 set2) == set1)), (not ((intersection set1 set2)== set2)) = "A intersiona B"
	| ((difference set1 set2) == []) = "B contem A"
	| ((difference set2 set1) == []) = "A contem B"

--comparaConjuntos :: (Eq t) => [t] -> [t] -> String
