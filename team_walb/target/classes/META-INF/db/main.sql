-- main query
select * from member;
SELECT * FROM ABOARD;

insert into circle values (CIRCLE_SEQ.NEXTVAL, '등산', 'user', '산을 즐기는 사람들의 모임', '수요일', 0, 'hiking.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, '캠핑', 'user', '주말에 떠나는 캠핑', '토요일', 5, 'camping.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, '야경 사진', 'user', '불금에는 카메라를 들고~', '금요일', 2, 'nightview.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, '플라잉 낚시', 'bbb', '강물에서 물결 따라 함께 하는 낚시', '토요일', 0, 'fFishing.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, '베이킹', 'ccc', '건강한 디저트를 직접 만드는 모임', '목요일', 5, 'baking.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, '먹방', 'ddd', '점심시간에 찍는 먹방!', '수요일', 2, 'pasta.jpg');
COMMIT;
select * from circle;

insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '북한산 등반기 짱짱5', sysdate, '2018-08-08', '피톤치드를 가장 많이 먹을 수 있는 북한산5', '127.0.0.1', 5);
insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '북한산 등반기 짱짱4', sysdate, '2018-08-08', '피톤치드를 가장 많이 먹을 수 있는 북한산4', '127.0.0.1', 4);
insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '북한산 등반기 짱짱3', sysdate, '2018-08-08', '피톤치드를 가장 많이 먹을 수 있는 북한산3', '127.0.0.1', 3);
insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '북한산 등반기 짱짱2', sysdate, '2018-08-08', '피톤치드를 가장 많이 먹을 수 있는 북한산2', '127.0.0.1', 2);
insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '북한산 등반기 짱짱1', sysdate, '2018-08-08', '피톤치드를 가장 많이 먹을 수 있는 북한산1', '127.0.0.1', 1);

-- 인기 동아리 #1 찾기
SELECT * FROM CIRCLE;
SELECT * FROM CIRCLE ORDER BY CHIT DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM CIRCLE ORDER BY CHIT DESC) A) WHERE RN=1;

COMMIT;
update aboard set atitle='북한산등반기 짱짱5', ACONTENT='피톤치드를 가장 많이 먹을 수 있는 북한산5' where anum=1;
-- 베스트 후기 뽑기 (대표이미지는 동아리 이미지)
SELECT C.CPHOTO, A.* FROM ABOARD A, CIRCLE C WHERE A.CNUM=C.CNUM ORDER BY ASCORE DESC;
SELECT ROWNUM RN, B.* FROM (SELECT C.CPHOTO, A.* FROM ABOARD A, CIRCLE C WHERE A.CNUM=C.CNUM ORDER BY ASCORE DESC) B;
SELECT * FROM (SELECT ROWNUM RN, B.* FROM (SELECT C.CPHOTO, C.CNAME, A.* FROM ABOARD A, CIRCLE C WHERE A.CNUM=C.CNUM ORDER BY ASCORE DESC) B) WHERE RN BETWEEN 1 AND 3;


-- 공지 게시판 ★자연수정★
DROP SEQUENCE GBOARD_SEQ;
CREATE SEQUENCE GBOARD_SEQ;
CREATE TABLE GBOARD(
    GNUM NUMBER(10) PRIMARY KEY,
    MID VARCHAR2(100),
    GTITLE VARCHAR2(100) NOT NULL,
    GCONTENT CLOB NOT NULL,
    GIP VARCHAR2(100) NOT NULL,
    GDATE DATE DEFAULT SYSDATE,
    GFILE VARCHAR2(200),
    FOREIGN KEY(MID) REFERENCES MEMBER(MID));
select * from GBOARD;
-- 공지글 출력(최근 순)     GNUM, MID, GTITLE, GCONTENT, GIP, GDATE, GFILE
insert into gboard values (gboard_seq.nextval, 'master', '공지1', '공지내용1', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '공지2', '공지내용2', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '공지3', '공지내용3', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '공지4', '공지내용4', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '공지5', '공지내용5', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '공지6', '공지내용6', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '공지7', '공지내용7', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '공지8', '공지내용8', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '공지9', '공지내용9', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '공지10', '공지내용10', '127.0.0.1', sysdate, 'noImg.jpg');
commit;
update gboard set GDATE='2018-08-08';
select * from gboard order by gnum desc;
select * from (select rownum rn, a.* from (select * from gboard order by gnum desc) a ) where rn between 1 and 5;

-- 번개게시판  ★자연수정★
DROP SEQUENCE BBOARD_SEQ;
CREATE SEQUENCE BBOARD_SEQ;
CREATE TABLE BBOARD(
    BNUM NUMBER(10) PRIMARY KEY, -- 번개번호
    CNUM NUMBER(3),              -- 해당 동아리 번호
    BTITLE VARCHAR2(100) NOT NULL, -- 번개 모임 제목
    BCONTENT CLOB,       -- 번개 모임 내용
    BSTART DATE DEFAULT SYSDATE, -- 등록일 date/timestamp
    BEND DATE NOT NULL,          -- 마감일 date/timestamp
    BCOUNT NUMBER(3) DEFAULT 0,  -- 신청수
    BPEOPLE NUMBER(3) NOT NULL,  -- 최소인원
    BACTI NUMBER(1) DEFAULT 0,   -- 활성화 >> 종료후 1
    FOREIGN KEY(CNUM) REFERENCES CIRCLE(CNUM));
    
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '오늘 저녁 7시 종각 막걸리 번개', '퇴근하고 종각 전집에서 막걸리 번개 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
to_date('2018-08-05 11:00', 'yyyy-mm-dd hh24:mi'), to_date('2018-08-05 20:00', 'yyyy-mm-dd hh24:mi'), 
1, 5, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '이번주말 북한산 물놀이 번개', '이번 주말에 북한산 물놀이와 막걸리 번개 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
to_date('2018-08-07 17:00', 'yyyy-mm-dd hh24:mi'), to_date('2018-08-07 19:00', 'yyyy-mm-dd hh24:mi'), 
1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '오늘 저녁 7시 종각 막걸리 번개', '퇴근하고 종각 전집에서 막걸리 번개 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 19:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '이번주말 북한산 물놀이 번개', '이번 주말에 북한산 물놀이와 막걸리 번개 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '오늘 저녁 8시 종각 소주 번개', '퇴근하고 종각 전집에서 소주 번개 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 19:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '이번토요일 파주 찍사 번개', '이번 주말에 파주로 출사 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);

insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '광복절 북한산 물놀이 번개', '이번 주말에 북한산 물놀이와 막걸리 번개 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '광복절 전날 화요일 저녁 8시 종각 소주 번개', '퇴근하고 종각 전집에서 소주 번개 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 19:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '광복절 파주 찍사 번개', '이번 주말에 파주로 출사 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);

insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '광복절 북한산 물놀이 번개', '이번 주말에 북한산 물놀이와 막걸리 번개 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '광복절 전날 화요일 저녁 8시 종각 소주 번개', '퇴근하고 종각 전집에서 소주 번개 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 19:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '광복절 파주 찍사 번개', '이번 주말에 파주로 출사 모임하실 분들 모집합니다. 3명이상 모여지면 모임 진행합니다!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);





commit;
-- to_date('09-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss')
select * from bboard;
select to_char(bend, 'yyyy-mm-dd hh:MM:ss') from bboard;
-- 번개 모임 게시판 출력 (시작시간 최근 순으로, 종료된 글 출력 안함)
-- select CPHOTO, BNUM, B.CNUM, BTITLE, BCONTENT, BCOUNT, BPEOPLE, BACTI, to_char(BSTART, 'yyyy-mm-dd hh24:mi') BSTART, to_char(BEND, 'yyyy-mm-dd hh24:mi') BEND from bboard B, CIRCLE C WHERE B.CNUM=C.CNUM AND BEND>SYSDATE ORDER BY BSTART DESC;
select * from (select rownum rn, a.* from (select CPHOTO, BNUM, B.CNUM, BTITLE, BCONTENT, BCOUNT, BPEOPLE, BACTI, to_char(BSTART, 'yyyy-mm-dd hh24:mi') BSTART, to_char(BEND, 'yyyy-mm-dd hh24:mi') BEND from bboard B, CIRCLE C 
WHERE B.CNUM=C.CNUM AND BEND>SYSDATE ORDER BY BSTART DESC) a ) where rn between 1 and 3;

select * from (select rownum rn, a.* from (select CPHOTO, CNAME, BNUM, B.CNUM, BTITLE, BCONTENT, BCOUNT, BPEOPLE, BACTI, BSTART, BEND from bboard B, CIRCLE C 
WHERE B.CNUM=C.CNUM AND BEND>SYSDATE AND BACTI=0 ORDER BY BSTART DESC) a ) where rn between 1 and 3;

-- select to_char(writerdate, 'yyyy-mm-dd hh24:mi:ss') from sale_plan;
UPDATE BBOARD SET BSTART=to_date('2018-08-05 11:00', 'yyyy-mm-dd hh24:mi'), BEND=to_date('2018-08-05 20:00', 'yyyy-mm-dd hh24:mi') WHERE BNUM=1;
COMMIT;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT CPHOTO, BNUM, B.CNUM, BTITLE, BCONTENT, BCOUNT, BPEOPLE, BSTART, TO_CHAR(BEND, 'yyyy.mm.dd hh24') BEND FROM BBOARD B, CIRCLE C WHERE B.CNUM=C.CNUM AND BEND>SYSDATE ORDER BY BSTART DESC) A ) WHERE RN BETWEEN 1 AND 3;
select to_char(bend, 'hh:mm') from bboard where TO_CHAR(BEND, 'YYYY-MM-DD')='2018-08-11';
select * from member;










