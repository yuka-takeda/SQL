/※46
SELECT
SUM(数量)
FROM 注文
/※47
SELECT
SUM(数量)
FROM 注文
GROUP BY 注文日
ORDER BY 注文日
/※48
SELECT
MIN(単価)
MAX(単価)
GROUP BY 商品区分
ORDER BY 商品区分
/※49
SELECT
SUM(数量)
GROUP BY 商品コード
ORDER BY 商品コード
/※50
SELECT 商品コード,数量
FROM商品
ORDER BY 数量 DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY
WHERE 数量=数量 ORDER BY 商品コード
/※51
SELECT 商品コード,数量
FROM 注文
WHERE 数量<5
/※52
SELECT COUNT(クーポン割引料),
SUM(クーポン割引料)
FROM 注文
/※53
SELECT COUNT(注文日) AS '年月' ,
COUNT(数量) AS ‘注文件数’
WHERE 注文枝番 = '1'
GROUP BY '年月'
ORDER BY 注文日 DESC
/※54
SELECT 商品コード
FROM 注文
WHERE SUBSTRING(商品コード,1,1) LIKE '%Z%'
AND 数量 >= 100