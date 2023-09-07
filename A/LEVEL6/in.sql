/※59
UPDATE 口座
SET 残高 = (SELECT *
           FROM 取引
           WHERE 口座番号 = '0351333'
           AND 取引日 = '2018-01-11')
/※60
SELECT 残高, SUM(入金額),SUM(出金額)
 (SELECT * FROM 取引
  WHERE 口座番号 = '1115600'
  AND 取引日 = '2017-12-28')
FROM 口座
/※61
SELECT ※ FROM 口座
WHERE 列名 IN ('口座番号' , '名義' , '残高')
AND 入金額 >= 1000000
/※62
SELECT * FROM 口座
WHERE 日付 > ALL(SELECT 日付 FROM 取引)
/※63
SELECT 日付
FROM (SELECT 入金額
      FROM 取引
      INTERSECT
      SELECT 出金額
      FROM 取引
WHERE 口座番号 = '3104451'
AND MAX(入金額),MAX(出金額))
/※64
INSERT INTO 廃止口座(口座番号,名義,種別,残高,更新日)
SELECT 口座番号,名義,種別,解約時残高,解約日
FROM 口座
WHERE 口座番号 = '2761055'
DELETE FROM 口座
WHERE 口座番号 = '2761055'











