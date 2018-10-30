SELECT ACTINUM, CNUM, PNUM, ACTITITLE, TO_CHAR(ACTIDATE, 'HH24:MI') ACTIDATE, ACTITIME, ACTICON, ACTICHK FROM ACTIVITY WHERE TO_CHAR(ACTIDATE, 'YYYY-MM-DD')=TO_CHAR(ACTIDATE, 'YYYY-MM-DD') AND PNUM=1 AND CNUM=1;
SELECT * FROM ACTIVITY;
INSERT INTO ACTIVITY VALUES(ACTIVITY_SEQ.NEXTVAL, 1, 1, '정기 동아리 활동', TO_DATE('2018-08-11 18:00', 'YYYY-MM-DD HH24:MI'), 3, '밴드 활동 연습', 0);

SELECT * FROM CIRCLE;

DROP SEQUENCE CIRCLE_SEQ;
CREATE SEQUENCE CIRCLE_SEQ;

INSERT INTO CIRCLE VALUES(CIRCLE_SEQ.NEXTVAL, '밴드', 'user', '음악활동', '월', 0, 'noImage.jpg');
INSERT INTO CIRCLE VALUES(2, '봉사', 'user', '봉사활동', '화', 0, 'noImage.jpg');
INSERT INTO CIRCLE VALUES(3, '등산', 'user', '등산활동', '수', 0, 'noImage.jpg');

SELECT * FROM CIRCLE;
DELETE FROM CIRCLE WHERE CNUM=3;

DELETE FROM ACTIVITY WHERE ACTINUM=1;
UPDATE ACTIVITY SET ACTICHK=0 WHERE ACTINUM=4;

UPDATE MEMBER SET MCIRCLE1=1, MCIRCLE2=2, MCIRCLE3=3 WHERE MID='user';

COMMIT;