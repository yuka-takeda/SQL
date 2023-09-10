/※6
SELECT 商品コード
FROM 商品
WHERE 商品コード = 'W1252'
/※7
UPDATE 商品
SET 単価 = 500
WHERE 商品コード = 'S0023'
/※8
SELECT *
FROM 商品
WHERE 単価<1000
/※9
SELECT *
FROM 商品
WHERE 単価 > 50000
/※10
SELECT 残高
FROM 注文
WHERE 注文日 >= '2018-01-01'
/※11
SELECT *
FROM 注文
WHERE 注文日 < '2017-11-01'
/※12
SELECT *
FROM 商品
WHERE 商品区分 IS NULL '1'
/※13
SELECT *
FROM 注文
WHERE クーポン割引料 IS NULL
/※14
DELEAT
FROM 商品
WHERE 商品コード LIKE '%N'
/※15
SELECT 商品コード, 商品名 ,単価
FROM 商品
WHERE 更新日 LIKE '%コート%'
/※16
SELECT 商品コード,商品区分
FROM 商品
WHERE 商品区分 IN('2' , '3' , '9')
/※17
SELECT *
FROM 商品
WHERE 商品コード BETWEEN 'A0100' AND 'A0500'
/※18
SELECT *
FROM 注文
WHERE 商品コード IN('N0501' , 'N1021' , 'N0223')
/※19
SELECT 商品コード,商品区分
FROM 商品
WHERE 商品名 ALL ('3' , '水玉')
/※20
SELECT *
FROM 商品
WHERE 商品名 IN('軽い' , 'ゆるふわ')
/※21
SELECT *
FROM 商品
WHERE (商品区分 = '1'
OR 商品区分 = '2')
AND (単価 <= 3000
OR 単価 >= 10000)
/※22
SELECT *
FROM 注文
WHERE 数量 >= 3
AND 更新日 BETWEEN '2018-03-01' AND '2018-03-31'
/※23
SELECT *
FROM 注文
WHERE 数量>= 10 AND クーポン割引料 >= 0
/※24
商品テーブル : 商品コード
注文テーブル : 注文番号、商品コード