/※1
SELECT 口座番号,名義,種別,残高,更新日
FROM 口座
/※2
SELECT 口座番号
FROM 口座
/※3
SELECT 口座番号,残高
FROM 口座
/※4
SELECT *
FROM 口座
/※5
UPDATE 名義
SET 'XXXX'
/※6
UPDATE 残高,更新日
SET 残高=99999999,更新日=2018-03-01
/※7
INSERT INTO 口座(口座番号,名義,種別,残高,更新日)
VALUES('0642191' , ’アオキハルカ’ , '1' , 3640551 , '2018-03-13' )
INSERT INTO 口座
VALUES('1039410' , ’キノシタリュウジ’ , '1' , 259017 , '2017-11-30' )
INSERT INTO 口座
VALUES('1239855' , ’タカシナミツル’ , '2', 6509773 , '指定なし' )
/※8
DELETE FROM 口座