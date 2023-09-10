/※34
SELECT 商品コード,単価,キャンペーン価格
FROM 商品
WHERE 商品区分 = '9'
AND TRUNC(キャンペーン価格*0.95,-1)
ORDER BY 商品コード
/※35
UPDATE 注文
SET クーポン割引料 = クーポン割引料-300
WHERE 注文日 BETWEEN '2018-03-12' AND '2018-03-14'
AND 数量 >= 2
/※36
UPDATE 注文
SET 数量 = 数量 - 1
WHERE 注文番号 = '201802250126'
AND 商品コード = 'W0156'
/※37
SELECT *
FROM 注文
WHERE 注文番号 BETWEEN '201710010001' AND '201710319999'
AND 注文番号 + '-' + 枝番
/※38
SELECT 商品区分,
CASE 商品区分 WHEN  '1' , '2' , '3' , '9' THEN '区分'
WHEN  '衣類' , '靴' , '雑貨' , '未分類' THEN '区分名'
END
FROM 商品
/※39
SELECT 商品コード,商品名,単価,販売価格ランク,商品区分,
CASE WHEN 単価 < 3000 THEN 'S'
WHEN 3000 <= 単価 < 10000 THEN 'M'
WHEN 単価 >= 10000
END AS 販売価格ランク
FROM 商品
ORDER BY 単価
WHERE 単価 = 単価 ORDER BY 商品コード
UPDATE 商品
SET 商品区分 = REPLACE(商品コード, '1' , '1:衣類')
AND 商品区分 = REPLACE(商品コード, '2' , '2:靴')
AND 商品区分 = REPLACE(商品コード, '3' , '3:雑貨')
AND 商品区分 = REPLACE(商品コード, '9' , '9:未分類')
/※40
SELECT 商品名,
FROM 商品
WHERE LENGTH(商品名) >= 10 AS 文字数
ORDER BY 文字数
/※41
SELECT 注文日,注文番号
FROM 注文
WHERE SUBSTRING(注文番号,9,4)
/※42
UPDATE 商品
SET 商品コード = REPLASE(商品コード,SUBSTRING(商品コード,1,'M'), SUBSTRING(商品コード,1,'E'))
/※43
SELECT 注文番号
FROM 注文
WHERE 注文番号 BETWEEN '1000' AND '2000'
ORDER BY SUBSTRING(注文番号,9,4)
/※44
UPDATE 廃盤商品
SET CURRENT_DATE
WHERE 廃盤日 = 'S1990'
/※45
SELECT 商品コード,商品名,値下げした単価
FROM 商品
WHERE 単価 >= 10000
AND TRUNC(単価*0.7,-1) AS '値下げした価格'