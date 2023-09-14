/※9
SELECT *
FROM 口座
WHERE 口座番号 = '0037615'
/※10
SELECT *
FROM 口座
WHERE 残高 > 0
/※11
SELECT *
FROM 口座
WHERE 口座番号<'1000000'
/※12
SELECT *
FROM 口座
WHERE 更新日< '2018-01-01'
/※13
SELECT *
FROM 口座
WHERE 残高>=1000000
/※14
SELECT *
FROM 口座
WHERE 種別 <> '1'
/※15
SELECT *
FROM 口座
WHERE 更新日 IS NULL
/※16
SELECT *
FROM 口座
WHERE 名義 LIKE '%ハシ%'
/※17
SELECT *
FROM 口座
WHERE 更新日 BETWEEN '2018-01-01' AND '2018-01-31'
/※18
SELECT *
FROM 口座
WHERE 種別 IN('2' , '3')
/※19
SELECT *
FROM 口座
WHERE 名義 IN ('サカタリョウヘイ' , 'マツモトミワコ' , 'ハマダサトシ')
/※20
SELECT *
FROM 口座
WHERE 更新日 >= '2017-12-30' AND 更新日 < '2018-01-05'
/※21
SELECT *
FROM 口座
WHERE 残高<10000 AND 更新日 IS NOT NULL
/※22
SELECT *
FROM 口座
WHERE 口座番号 LIKE '2______'
OR 名義 LIKE 'エ_ %コ'
/※23
口座テーブル : 口座番号
取引テーブル : 取引番号
取引事由テーブル : 取引事由ID