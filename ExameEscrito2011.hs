-- questao 1
myMember :: Eq a => a -> [a] -> Bool
myMember x [] = False
myMember x (a:as) = if x == a then True else myMember x as

myUnion :: Eq a => [a] -> [a] -> [a]
myUnion x [] = x
myUnion [] y = y
myUnion (a:as) l
	| myMember a l = myUnion as l
	| otherwise = a : myUnion as l

inter :: Eq a => [a] -> [a] -> [a]
inter l1 l2 = [x | x <- l1, myMember x l2]

diff :: Eq a => [a] -> [a] -> [a]
diff l1 l2 = [x | x <- l1, not (myMember x l2)] ++ [y | y <- l2, not (myMember y l1)]
--fim da questao 1

-- questao 2
type Autor = String
type TextoAssociado = String
data FaceBookPost obj = FaceBookPost Autor TextoAssociado [obj]

postDeAmigosInteressantes :: [Autor] -> [FaceBookPost obj] -> [FaceBookPost obj]
postDeAmigosInteressantes  _ [] = []
postDeAmigosInteressantes [] _ = []
postDeAmigosInteressantes amigos ((FaceBookPost a t o):l) =
	if elem a amigos then
		(FaceBookPost a t o) : postDeAmigosInteressantes amigos l
	else 
		postDeAmigosInteressantes amigos l

-- teste: postDeAmigosInteressantes ["Neymar", "Oscar", "Dunga"] [FaceBookPost "Oscar" "lorem ipsum" [FaceBookPost "Marcelo" "bla bla" []]]

instance Show obj => Show (FaceBookPost obj) where
	show (FaceBookPost a t o) = "Post: " ++ show a ++ " " ++  show t ++ " " ++ show o

instance Eq obj => Eq (FaceBookPost obj) where
	(FaceBookPost a t o) == (FaceBookPost aa tt oo) = (a == aa) && (t == tt) && (o == oo) 

