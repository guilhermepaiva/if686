--tipo para representar a tabela hash
type HashTable = [(Integer, String)]

mySample = [(1, "Sushi"), (2, "Macarronada"), (3, "Feijoada"), (4, "Lasanha"), (5,"Big Mac"), (6,"Risoto")]

get :: HashTable -> Integer -> String
get [] _ = "Nops"
get ((hashKey, hashValue):as) theKey
	| hashKey == theKey = hashValue
	| otherwise = get as theKey