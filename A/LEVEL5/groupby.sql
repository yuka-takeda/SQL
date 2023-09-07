/※49
SELECT
SUM(残高)
MAX(残高)
MIN(残高)
AVG(残高)
FROM 口座
SELECT COUNT(*)
FROM 口座
/※50
SELECT COUNT(*)
FROM 口座
WHERE NOT 種別 = '普通'
          残高 >= 1000000
          更新日 < '2018-01-01'
/※51
SELECT COUNT(更新日 IS NULL)
FROM 口座
/※52
SELECT
MAX(名義)
MIN(名義)
FROM 口座
/※53
SELECT
MAX(更新日)
MIN(更新日)
FROM 口座
/※54
SELECT 種別,
SUM(残高)
MAX(残高)
MIN(残高)
AVG(残高)
FROM 口座
SELECT COUNT(*)
FROM 口座
GROUP BY 種別
/※55 
SELECT COUNT(*) AS 件数
FROM 口座
GROUP BY (口座番号,7,1)
ORDER BY 件数
/※56
SELECT 更新日(年),
SUM(残高)
MAX(残高)
MIN(残高)
AVG(残高)
FROM 口座
SELECT COUNT(*)
FROM 口座
REPLACE(口座,更新日 IS NULL,'XXXX年')
/※57
SELECT 種別,COUNT(*) AS データ件数
SUM(残高)
FROM 口座
GROUP BY 種別
DELEAT FROM 口座
WHERE SUM(残高) <= 3000000
/※58 
SELECT COUNT(*) AS 件数,
AVG(LENGTH(REPLASE(名義,'　',''))) AS 文字数の平均,
WHERE 件数 >= 10
OR 文字数の平均 > 5
GROUP BY (名義,1,1)
