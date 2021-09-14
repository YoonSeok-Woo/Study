--주석
/*

여러줄 주석

*/
-- 데이터 전체 조회 SELECT
SELECT * FROM examples;
-- 테이블 생성
CREATE TABLE classmates (
id INTEGER PRIMARY KEY,
name TEXT
);

-- 테이블 삭제
DROP TABLE classmates;

CREATE TABLE classmates(
name TEXT,
age INT,
adress TEXT
);
INSERT INTO classmates(name, age,adress) VALUES('홍길동',23,'서울');
INSERT INTO classmates VALUES('홍길동',30,'서울');
SELECT rowid,name FROM classmates WHERE adress = '서울';
SELECT DISTINCT age FROM classmates;
DELETE FROM classmates WHERE rowid = 5;

INSERT INTO classmates VALUES('최전자',28,'부산');

UPDATE classmates SET name='홍길동',adress = '제주도' WHERE rowid=5