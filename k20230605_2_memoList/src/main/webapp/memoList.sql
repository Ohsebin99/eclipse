INSERT INTO memolist(NAME, PASSWORD, memo, ip) VALUES ('홍길동', '1111', '1등 입니다.', '162.168.100.001');
INSERT INTO memolist(NAME, PASSWORD, memo, ip) VALUES ('임꺽정', '1111', '2등 입니다.', '162.168.100.002');
INSERT INTO memolist(NAME, PASSWORD, memo, ip) VALUES ('장길산', '1111', '3등 입니다.', '162.168.100.003');
INSERT INTO memolist(NAME, PASSWORD, memo, ip) VALUES ('일지매', '1111', '4등 입니다.', '162.168.100.004');

SELECT * FROM memolist ORDER BY idx DESC;
SELECT * FROM memolist ORDER BY idx DESC LIMIT 10, 10;
SELECT * FROM memolist WHERE idx = 556;

DELETE FROM memolist;
ALTER TABLE memolist AUTO_INCREMENT = 1;

SELECT COUNT(*) FROM memolist;
SELECT COUNT(*) AS 'cnt' FROM memolist;