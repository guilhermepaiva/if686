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