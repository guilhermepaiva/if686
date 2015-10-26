-- Tutorial desenvolvido por Paulo Lieuthier

type Name = String
type Age = Int
type Phone = Int
type Person = (Name, Age, Phone)

father :: Person -> Maybe Person
mother :: Person -> Maybe Person

parents :: Person -> Maybe (Person, Person)
parents p = do 
	f <- father p
	m <- mother p
	return (f, m)