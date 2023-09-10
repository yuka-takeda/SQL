/※55
SELECT商品コード, 商品名,単価,数量
(SELECT * FROM 注文)
FROM 商品
/※56
UPDATE 注文
SET 商品コード = (SELECT 商品コード
                FROM 商品
                WHERE 注文日 = '2018-03-15'
                AND 注文番号 = '201803150014'
AND 注文枝番 = '1')
WHERE 商品区分 = '靴'
AND 商品名 = ALL('ブーツ' , '雨' , '安心')
/※57
SELECT * FROM 注文
WHERE 列名 IN ('注文日' , '商品コード')
ORDER BY 注文日
/※58
SELECT * FROM 商品
WHERE AVG(数量) > ALL(SELECT 商品コード,数量 FROM 注文)
GROUP BY 商品
/※59
SELECT
FROM (SELECT COUNT(商品名) AS '割引による販売数'
      FROM 商品
      UNION
      SELECT AVG(クーポン割引料) AS ‘平均割引額’
      FROM 注文
      WHERE TRUNC(割引による販売数,-1)
      AND TRUNC(平均割引額,-1)
      AND 商品コード = 'W0746')
/※60
INSERT INTO 注文(注文日,注文番号,商品コード,数量,クーポン割引)
SELECT 商品コード
FROM 注文
WHERE 商品コード = 'S1003'
AND 商品コード = 'A0052'