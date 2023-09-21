/*45*/
SELECT
    MAX(HP) AS 最大HP,
    MAX(MP) AS 最大MP,
    MIN(HP) AS 最小HP,
    MIN(MP) AS 最小MP,
    AVG(HP) AS 平均HP,
    AVG(MP) AS 平均MP
FROM
    パーティー

/*46*/
SELECT
    CASE タイプ
        WHEN '1' THEN '強制'
        WHEN '2' THEN 'フリー'
        WHEN '3' THEN '特殊'
    END AS タイプ,
    COUNT(イベント番号) AS イベント数
FROM
    イベント
GROUP BY
    タイプ

/*47*/
SELECT
    クリア結果,
    COUNT(イベント番号) AS イベント数
FROM
    経験イベント
WHERE
    クリア区分 = '1'
GROUP BY
    クリア結果
ORDER BY
    クリア結果

/*48*/
SELECT
    CASE
        WHEN SUM(MP) < 500 THEN '敵は見とれている！'
        WHEN SUM(MP) >= 500
    AND SUM(MP) < 1000 THEN '敵は呆然としている！'
        WHEN SUM(MP) >= 1000 THEN '敵はひれ伏している！'
    END AS 小さな奇跡
FROM
    パーティー

/*49*/
SELECT
    CASE クリア区分
        WHEN '1' THEN 'クリアした'
        WHEN '0' THEN '参加したがクリアしていない'
    END AS 区分,
    COUNT(イベント番号) AS イベント数
FROM
    経験イベント
GROUP BY
    クリア区分

/*50*/
SELECT
    SUBSTRING(職業コード, 1, 1) AS 職業タイプ,
    MAX(HP) AS 最大HP,
    MAX(MP) AS 最大MP,
    MIN(HP) AS 最小HP,
    MIN(MP) AS 最小MP,
    AVG(HP) AS 平均HP,
    AVG(MP) AS 平均MP
FROM
    パーティー
GROUP BY
    SUBSTRING(職業コード, 1, 1)

/*51*/
SELECT
    SUBSTRING(ID, 1, 1) AS IDによる分類,
    AVG(HP) AS HPの平均,
    AVG(MP) AS MPの平均
FROM
    パーティー
GROUP BY
    SUBSTRING(ID, 1, 1)
HAVING AVG(HP) > 100

/*52*/
SELECT
    SUM(
        CASE
            WHEN HP < 100 THEN 1
            WHEN HP >= 100
        AND HP < 150 THEN 2
            WHEN HP >= 150
        AND HP < 200 THEN 3
            WHEN HP >= 200 THEN 5
        END
    )
END AS 開けられる扉の数
FROM
    パーティー