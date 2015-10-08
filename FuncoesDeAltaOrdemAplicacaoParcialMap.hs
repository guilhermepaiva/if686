mediaComBonus1 :: (Ord a, Fractional a) => a -> a -> a
mediaComBonus1 x y = if (x+y)/2 > 7 then (x+y)/2 + 0.5 else (x+y)/2

-- deixando o código mais legível
media :: (Ord a, Fractional a) => a -> a -> a
media x y = (x + y)/2

mediaComBonus2 :: (Ord a, Fractional a) => a -> a -> a
mediaComBonus2 x y = if media x y > 7 then
						(x + y)/2 + 0.5
					 else
					 	(x + y)/2

-- melhorando mais ainda a legibilidade e performance
mediaComBonus3 :: (Ord a, Fractional a) => a -> a -> a
mediaComBonus3 x y = if m > 7 then
						m + 0.5
					 else
					 	m
					 where m = media x y


mediaComBonus4 :: (Ord a, Fractional a) => a -> a -> a
mediaComBonus4 x y = m + (if m > 7 then 0.5 else 0)
	where m = media x y

-- generalizando o limite da média para receber o bônus, parametrizando este valor
mediaComBonus5 :: (Ord a, Fractional a) => a -> a -> a -> a
mediaComBonus5 x y v = if m > v then
					    m + 0.5
					   else
					   	m
					   where m = media x y

-- o mesmo processo de generalização aplicado ao bônus
mediaComBonus6 :: (Ord a, Fractional a) => a -> a -> a -> a -> a
mediaComBonus6 x y v b = m + (if m > v then b else 0)
	where m = media x y

mediaPLC nota1 nota2 = mediaComBonus6 nota1 nota2 7 0.5
mediaMR nota1 nota2 = mediaComBonus6 nota1 nota2 6 0.5

-- agora aplicando uma política específica a todos os alunos de uma turma
mediasPLC :: (Ord t1, Fractional t1) => [(t, t1, t1)] -> [(t, t1)]
mediasPLC [] = []
mediasPLC ((nome, nota1, nota2) : l) = (nome, (mediaPLC nota1 nota2)) : mediasPLC l

--entrada teste
turma = [("Pedro",9,3),("Mariana",7,7),("Paulo",5,5),("Clarissa",10,5)]

turma1 = mediasPLC turma

-- para aplicar essa política para outra turma, o jeito seria replicar o código
mediasMR :: (Ord t1, Fractional t1) => [(t, t1, t1)] -> [(t, t1)]
mediasMR [] = []
mediasMR ((nome, nota1, nota2) : l) = (nome, (mediaMR nota1 nota2)) : mediasMR l

--testando 
turma2 = mediasMR turma

-- mas e para professores que não gostam de bônus, teríamos que replicar código novamente
medias :: (Ord t1, Fractional t1) => [(t, t1, t1)] -> [(t, t1)]
medias [] = []
medias ((nome, nota1, nota2) : l) = (nome, media nota1 nota2) : medias l

--testando
turma3 = medias turma

-- o que fazer para generalizar? a função entra como parâmetro de outra função
mediasf :: (t -> t1 -> t3) -> [(t2, t, t1)] -> [(t2, t3)]
mediasf f [] = []
mediasf f ((nome, nota1, nota2) : l) = (nome, f nota1 nota2) : mediasf f l

--testando
turma4 = mediasf mediaPLC turma
turma5 = mediasf mediaMR turma
turma6 = mediasf media turma

-- serve até para implementar outras políticas, diferente do cálculo da média
maior nota1 nota2 = if nota1 > nota2 then nota1 else nota2
maiores l = mediasf maior l

-- e se só quisermos a lista de nomes dos alunos
nomes [] = []
nomes ((nome, nota1, nota2) : l) = nome : nomes l

-- teste: nomes turma

mapr f [] = []
mapr f (e:l) = (f e) : mapr f l

nomet (nome,nota1,nota2) = nome
mediat (nome,nota1,nota2) = (nome,media nota1 nota2)
mediaPLCt (nome,nota1,nota2) = (nome,mediaPLC nota1 nota2)
mediaMRt (nome,nota1,nota2) = (nome,mediaMR nota1 nota2)
maiort (nome,nota1,nota2) = (nome,maior nota1 nota2)
nota1t (nome,nota1,nota2) = nota1
nota2t (nome,nota1,nota2) = nota2

nomesm l = map nomet l
mediasm l = map mediat l
mediasPLCm l = map mediaPLCt l
mediasMRm l = map mediaMRt l
maioresm l = map maiort l
notas1m l = map nota1t l

--testando
turma7 = mediasPLCm turma















