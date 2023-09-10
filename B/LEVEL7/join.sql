/※61
SELECT 注文番号,注文枝番,商品コード,数量
FROM 注文
JOIN 商品
ON 注文.商品コード = 商品.商品コード
WHERE 注文番号 = '201801130115'
ORDER BY 注文番号,注文枝番
/※62
SELECT 注文日,注文番号,注文枝番,数量,注文金額
FROM 廃盤商品
JOIN 注文
ON 廃盤商品.商品コード = 注文.商品コード
WHERE 注文金額 = 単価*数量
AND 商品コード = 'A0009'
/※63
SELECT 商品コード,商品名,単価,注文日,注文番号,数量
FROM 商品
JOIN 注文
ON 商品.商品コード = 注文.商品コード
JOIN 売上金額 = 単価*数量
WHERE 商品コード = 'S0604'
ORDER BY 注文日
/※64
SELECT 商品コード,商品名
FROM 商品
WHERE 注文日 = '2018-08'
/※65
SELECT 商品コード,商品名 AS '廃盤'
FROM 商品,廃盤商品
WHERE 注文日 = '2018-08'
/※66
SELECT 注文日,商品コード,商品名,数量
FROM 商品
JOIN 注文
ON 商品.商品コード = 注文.商品コード
WHERE 商品区分 = '雑貨'
AND 商品名 = 商品コード + ':' + 商品名 AS 商品
/※67
SELECT 注文日,商品コード,商品名,数量
FROM 商品
JOIN 注文
ON 商品.商品コード = 注文.商品コード
JOIN (SELECT 商品コード,商品名,廃番日,売上個数
FROM 廃盤商品
WHERE 商品コード = 商品コード + ':(廃番済み)')
ON 注文.商品コード = 廃番商品.商品コード
WHERE 商品区分 = '雑貨'
/※68
SELECT 注文日,注文番号,注文枝番,商品コード,商品名,単価,数量,注文金額
FROM 注文
JOIN 廃盤商品
ON 注文.商品コード = 廃盤商品.商品コード
WHERE 注文金額 = 単価*数量-クーポン割引料
AND 注文番号 = '201704030010'
/※69
SELECT 商品コード,商品名,単価
FROM 商品
JOIN (SELECT COUNT(数量)
FROM 注文)
ON 商品.商品コード = 注文.商品コード
WHERE SUM(単価*数量) AS '総売上金額'
AND 商品コード = '%B'
ORDER BY 商品コード
/※70
SELECT A.商品コード,A.商品名,B.関連商品コード,B.関連商品名
FROM 商品 AS A
LEFT JOIN 商品 AS B
ON A.口座番号 = B.口座番号