/※9
SELECT 口座番号
FROM 口座
WHERE '0037615'
/※10
SELECT 残高
FROM 口座
WHERE 残高 > 0
/※11
SELECT 口座番号
FROM 口座
WHERE 口座番号<'1000000'
/※12
SELECT 更新日
FROM 口座
WHERE 更新日< 2018-01-01
/※13
SELECT 残高
FROM 口座
WHERE 残高>1000000
/※14
SELECT 種別
FROM 口座
WHERE 種別 IS NULL '普通'
/※15
SELECT 更新日
FROM 口座
WHERE 更新日 IS NULL
/※16
SELECT *
FROM 口座
WHERE 名義 LIKE '%ハシ%'
/※17
SELECT *
FROM 口座
WHERE 更新日 LIKE '%2018-01%'
/※18
SELECT *
FROM 口座
WHERE 種別 IN('当座' , '別段')
/※19
SELECT *
FROM 口座
WHERE 名義 = ALL('サカタリョウヘイ' , 'マツモトミワコ' , 'ハマダサトシ')
/※20
SELECT *
FROM 口座
WHERE 更新日 BETWEEN '2017-12-30' AND '2018-01-04'
/※21
SELECT *
FROM 口座
WHERE 残高<10000 AND 更新日IS NOT NULL
/※22
SELECT *
FROM 口座
WHERE 口座番号 BETWEEN 2000000
AND 2999999
OR 名義 LIKE エ_%コ
/※23
口座テーブル : 口座番号
取引テーブル : 取引番号、取引事由ID、口座番号
取引事由テーブル : 取引事由ID
