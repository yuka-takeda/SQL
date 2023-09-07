/※34
SELECT 口座番号
残高>1000000 AS 千円単位の残高
FROM 口座

/※35
INSERT INTO 口座(口座番号,名義,種別,残高,更新日) VALUES ('0652281' , 'タカギノブオ' , '1' , '100000 + 3000' , '2018-04-01')
INSERT INTO 口座(口座番号,名義,種別,残高,更新日) VALUES ('1026413' , 'マツモトサワコ' , '1' , '300000 + 3000' , '2018-04-02')
INSERT INTO 口座(口座番号,名義,種別,残高,更新日) VALUES ('2239710' , 'タカギノブオ' , '1' , '1000000 + 3000' , '2018-04-03')

/※36
UPDATE 口座
SET 残高= (残高 - 3000)* 1.003
FROM 口座
WHERE 更新日<

/※37 
SELECT 口座番号,
       更新日,
       更新日 + 180 AS 通帳期限日
FROM 口座
WHERE 更新日<2017-01-01

/※38
SELECT 口座番号,
       名義 || 'カ）' AS 名義
FROM 口座
WHERE 種別 = '3'

/※39
SELECT 種別 AS 種別コード,
 CASE 種別 WHEN '1' THEN '普通'
                   WHEN '2' THEN '当座'
                   WHEN '3' THEN '別段'
END AS 種別名
FROM 口座

/※40
SELECT 口座番号,名義
 CASE WHEN 残高<10000 THEN 'C'
            WHEN 残高>=10000 AND 残高<1000000 THEN 'B'
            ELSE 'A'
END AS 残高ランク
FROM 口座

/※41 
SELECT LENGTH 口座番号,
       LENGTH(REPLACE(名義 , '　' , '')),
       LENGTH 残高
FROM 口座

/※42
SELECT * FROM 口座
 WHERE SUBSTRING（名義, 1, 5）LIKE '%カワ%'

/※43
SELECT * FROM 口座
WHERE LENGTH(残高) >= 4
AND 残高 < 1000
AND TRUNC(残高,-3)

/※44
SELECT 口座番号,残高,利息
ORDER BY 口座番号 DESC,残高 DESC,利息 DESC
WHERE TRUNC(残高*0.02,-1)
FROM 口座

/※45
SELECT 口座番号,残高,利息別利息
CASE WHEN 残高<500000 THEN 0.01
     WHEN 500000<残高<2000000 THEN 0.02
     WHEN 2000000<残高 THEN 0.03
END AS 残高別利息
FROM 口座
WHERE TRUNC(残高別利息,-1)
ORDER BY 残高別利息 DESC
AND ORDER BY 口座番号

/※46
INSERT INTO 口座
VALUES ('0351262' , 'イトカワダイ' , '2' , '635110' , CURRENT_DATE)
VALUES ('1015513' , 'アキツジュンジ' , '1' , '88463' , CURRENT_DATE)
VALUES ('1739298' , 'ホシノサトミ' , '1' , '704610' , CURRENT_DATE)

/※47
SELECT * 
FROM 口座
CAST(更新日 >= 2018-01-01) AS 'YYYY年MM月DD日'

/※48
SELECT 更新日 
FROM 口座
WHERE 更新日 IS NULL AS '設定なし'