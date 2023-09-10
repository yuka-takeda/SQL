/※65
SELECT 口座番号,日付,取引事由名,取引金額
FROM 取引
JOIN 取引事由
ON 取引.取引事由ID = 取引事由.取引事由ID
WHERE 口座番号 = ALL('0311240','1234161','2750902')
AND 取引金額 = ANY(入金額,出金額)
ORDER BY 口座番号

/※66
SELECT 口座番号,名義,残高,日付,入金額,出金額
FROM 口座
JOIN 取引
ON 口座.口座番号 = 取引.口座番号
WHERE 口座番号 = '0887132'
ORDER BY 日付

/※67
SELECT 口座番号,名義,残高
FROM 取引
JOIN 口座
ON 取引.口座番号 = 口座.口座番号
WHERE 日付 = '2017-03-01'

/※68
SELECT 口座番号,名義,残高
FROM 取引
JOIN 口座
ON 取引.口座番号 = 口座.口座番号
JOIN (SELECT FROM 口座番号,名義,残高
FROM 廃止口座
WHERE 名義 = '解約済み'
AND 残高 = 0)
ON 口座.口座番号 = 廃止口座.口座番号
WHERE 日付 = '2017-03-01'

/※69
SELECT *
FROM 取引
JOIN (SELECT * FROM 取引事由
WHERE 取引事由 = 取引事由ID + ':' + 取引事由)
ON 取引.取引事由ID = 取引事由.取引事由ID

/※70
SELECT 取引事由ID
FROM 取引
JOIN 取引事由
ON 取引.取引事由ID = 取引事由.取引事由ID

/※71
SELECT 口座番号,名義,残高,日付,入金額,出金額
FROM 口座
JOIN 取引
ON 口座.口座番号 = 取引.口座番号
JOIN 取引事由
ON 取引.取引事由ID = 取引事由.取引事由ID
WHERE 口座番号 = '0887132'
ORDER BY 日付

/※72
SELECT 口座番号,名義,残高,日付,取引事由ID,入金額,出金額
FROM 口座
JOIN 取引
ON 口座.口座番号 = 取引.口座番号
WHERE 残高 >= 5000000
AND 日付 >= '2018-01-01'
AND 入金額, 出金額 >= 1000000

/※73
SELECT 口座番号,名義,残高,日付,入金額,出金額
FROM 口座
JOIN (SELECT 取引事由ID FROM 取引
WHERE 残高 >= 5000000
AND 日付 >= '2018-01-01'
AND 入金額, 出金額 >= 1000000)
ON 口座.口座番号 = 取引.口座番号

/※74
SELECT 口座番号,COUNT(口座番号)
FROM 取引
JOIN (SELECT 名義 FROM 口座)
ON 取引.口座番号 = 口座.口座番号
WHERE COUNT(口座番号) >= 3

/※75
SELECT A.名義,A.口座番号,A.残高,A.更新日,B.名義,B.口座番号,B.残高,B.更新日
FROM 取引 AS A
LEFT JOIN 取引 AS B
ON A.口座番号 = B.口座番号
ORDER BY 名義
ORDER BY 口座番号