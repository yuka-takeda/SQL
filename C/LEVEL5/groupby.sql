/*45*/
SELECT MAX(HP),MAX(MP),MIN(HP),MIN(MP),AVG(HP),AVG(MP)
FROM パーティー

/*46*/
SELECT COUNT(イベント番号)
FROM イベントテーブル
GROUP BY タイプ

/*47*/
SELECT COUNT(クリア結果)
FROM 経験イベント
GROUP BY クリア結果
ORDER BY クリア結果

/*48*/
SELECT MP,
CASE WHEN MP < 500 THEN '敵は見とれている！'
WHEN MP >= 500 AND MP < 1000 THEN '敵は呆然としている！'
WHEN MP >= 1000 THEN '敵はひれ伏している！'
END AS 小さな奇跡
FROM パーティー

/*49*/
SELECT COUNT(ルート番号) AS クリアした,COUNT(ルート番号 IS NULL) AS 参加したがクリアしていない
FROM 経験イベントテーブル

/*50*/
SELECT MAX(HP),MAX(MP),MIN(HP),MIN(MP),AVG(HP),AVG(MP)
FROM パーティー
GROUP BY SUBSTRING(職業コード,1,1) AS 職業タイプ

/*51*/
SELECT ID,AVG(HP),AVG(MP)
FROM パーティー
GROUP BY SUBSTRING(ID,1,1)
HAVING AVG(HP) > 100

/*52*/
SELECT COUNT(扉の数)
CASE WHEN HP < 100 THEN 1 AS '扉の数'
WHEN HP >= 100 AND HP < 150 THEN 2 AS '扉の数'
WHEN HP >= 150 AND HP < 200 THEN 3 AS '扉の数'
ELSE 4 AS '扉の数'
END AS '力の扉'
FROM パーティー