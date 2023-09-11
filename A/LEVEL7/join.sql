/※65
SELECT T.口座番号,T.日付,J.取引事由名
COALESCE(T.入金額,T.出金額)AS 取引金額
FROM 取引 AS T
JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID
WHERE T.口座番号 IN('0311240','1234161','2750902')
ORDER BY T.口座番号,T.取引番号

/※66
SELECT K.口座番号,K.名義,K.残高,T.日付,T.入金額,T.出金額
FROM 口座 AS K
JOIN 取引 AS T
ON K.口座番号 = T.口座番号
WHERE K.口座番号 = '0887132'
ORDER BY T.取引番号

/※67
SELECT T.口座番号,K.名義,K.残高
FROM 取引 AS T
JOIN 口座 AS K
ON T.口座番号 = K.口座番号
WHERE T.日付 = '2017-03-01'

/※68
SELECT T.口座番号,COALESCE(K.名義 , '解約済み') AS 名義,
COALESCE(K.残高,0) AS 残高
FROM 取引 AS T
LEFT JOIN 口座 AS K
ON T.口座番号 = K.口座番号
WHERE T.日付 = '2017-03-01'

/※69
SELECT T.取引番号,CAST(J.取引事由ID AS VARCHAR) || ':' || J.取引事由名 AS 取引事由,T.日付,T.口座番号,T.入金額,T.出金額
FROM 取引 AS T
RIGHT JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID

/※70
SELECT DISTINCT COALESCE(T.取引事由ID,J.取引事由ID),J.取引事由名
FROM 取引 AS T
FULL JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID

/※71
SELECT K.口座番号,K.名義,K.残高,T.日付,J.取引事由名,T.入金額,T.出金額
FROM 口座 AS K
JOIN 取引 AS T
ON K.口座番号 = T.口座番号
JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID
WHERE K.口座番号 = '0887132'
ORDER BY T.取引番号

/※72
SELECT K.口座番号,K.名義,K.残高,T.日付,T.取引事由ID,T.入金額,T.出金額
FROM 口座 AS K
JOIN 取引 AS T
ON K.口座番号 = T.口座番号
WHERE K.残高 >= 5000000
AND (T.入金額 >= 1000000 OR T.出金額 >= 1000000)
AND T.日付 >= '2018-01-01'

/※73
SELECT K.口座番号,K.名義,K.残高,T.日付,T.取引事由ID,T.入金額,T.出金額
FROM 口座 AS K
JOIN (SELECT 口座番号,日付,取引事由ID,入金額,出金額 FROM 取引
WHERE (入金額 >= 1000000
OR 出金額 >= 1000000)
AND 日付 >= '2018-01-01') AS T
ON K.口座番号 = T.口座番号
WHERE K.残高 >= 5000000

/※74
SELECT K.口座番号,T.回数,K.名義 
FROM 口座 AS K
JOIN (SELECT 口座番号,COUNT(*) AS 回数 FROM 取引
GROUP BY 口座番号,日付 HAVING COUNT(*) >= 3) AS T
ON K.口座番号 = T.口座番号

/※75
SELECT DISTINCT K1.名義,K1.口座番号,K1.種別,K1.残高,K1.更新日
FROM 口座 AS K1
JOIN 口座 AS K2
ON K1.名義 = K2.名義
WHERE K1.口座番号 <> B.口座番号
ORDER BY K1.名義,K1.口座番号