-- main query
select * from member;
SELECT * FROM ABOARD;

insert into circle values (CIRCLE_SEQ.NEXTVAL, '���', 'user', '���� ���� ������� ����', '������', 0, 'hiking.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, 'ķ��', 'user', '�ָ��� ������ ķ��', '�����', 5, 'camping.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, '�߰� ����', 'user', '�ұݿ��� ī�޶� ���~', '�ݿ���', 2, 'nightview.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, '�ö��� ����', 'bbb', '�������� ���� ���� �Բ� �ϴ� ����', '�����', 0, 'fFishing.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, '����ŷ', 'ccc', '�ǰ��� ����Ʈ�� ���� ����� ����', '�����', 5, 'baking.jpg');
insert into circle values (CIRCLE_SEQ.NEXTVAL, '�Թ�', 'ddd', '���ɽð��� ��� �Թ�!', '������', 2, 'pasta.jpg');
COMMIT;
select * from circle;

insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '���ѻ� ��ݱ� ¯¯5', sysdate, '2018-08-08', '����ġ�带 ���� ���� ���� �� �ִ� ���ѻ�5', '127.0.0.1', 5);
insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '���ѻ� ��ݱ� ¯¯4', sysdate, '2018-08-08', '����ġ�带 ���� ���� ���� �� �ִ� ���ѻ�4', '127.0.0.1', 4);
insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '���ѻ� ��ݱ� ¯¯3', sysdate, '2018-08-08', '����ġ�带 ���� ���� ���� �� �ִ� ���ѻ�3', '127.0.0.1', 3);
insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '���ѻ� ��ݱ� ¯¯2', sysdate, '2018-08-08', '����ġ�带 ���� ���� ���� �� �ִ� ���ѻ�2', '127.0.0.1', 2);
insert into aboard values (ABOARD_SEQ.NEXTVAL, 1, '���ѻ� ��ݱ� ¯¯1', sysdate, '2018-08-08', '����ġ�带 ���� ���� ���� �� �ִ� ���ѻ�1', '127.0.0.1', 1);

-- �α� ���Ƹ� #1 ã��
SELECT * FROM CIRCLE;
SELECT * FROM CIRCLE ORDER BY CHIT DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM CIRCLE ORDER BY CHIT DESC) A) WHERE RN=1;

COMMIT;
update aboard set atitle='���ѻ��ݱ� ¯¯5', ACONTENT='����ġ�带 ���� ���� ���� �� �ִ� ���ѻ�5' where anum=1;
-- ����Ʈ �ı� �̱� (��ǥ�̹����� ���Ƹ� �̹���)
SELECT C.CPHOTO, A.* FROM ABOARD A, CIRCLE C WHERE A.CNUM=C.CNUM ORDER BY ASCORE DESC;
SELECT ROWNUM RN, B.* FROM (SELECT C.CPHOTO, A.* FROM ABOARD A, CIRCLE C WHERE A.CNUM=C.CNUM ORDER BY ASCORE DESC) B;
SELECT * FROM (SELECT ROWNUM RN, B.* FROM (SELECT C.CPHOTO, C.CNAME, A.* FROM ABOARD A, CIRCLE C WHERE A.CNUM=C.CNUM ORDER BY ASCORE DESC) B) WHERE RN BETWEEN 1 AND 3;


-- ���� �Խ��� ���ڿ�������
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
-- ������ ���(�ֱ� ��)     GNUM, MID, GTITLE, GCONTENT, GIP, GDATE, GFILE
insert into gboard values (gboard_seq.nextval, 'master', '����1', '��������1', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '����2', '��������2', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '����3', '��������3', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '����4', '��������4', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '����5', '��������5', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '����6', '��������6', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '����7', '��������7', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '����8', '��������8', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '����9', '��������9', '127.0.0.1', sysdate, 'noImg.jpg');
insert into gboard values (gboard_seq.nextval, 'master', '����10', '��������10', '127.0.0.1', sysdate, 'noImg.jpg');
commit;
update gboard set GDATE='2018-08-08';
select * from gboard order by gnum desc;
select * from (select rownum rn, a.* from (select * from gboard order by gnum desc) a ) where rn between 1 and 5;

-- �����Խ���  ���ڿ�������
DROP SEQUENCE BBOARD_SEQ;
CREATE SEQUENCE BBOARD_SEQ;
CREATE TABLE BBOARD(
    BNUM NUMBER(10) PRIMARY KEY, -- ������ȣ
    CNUM NUMBER(3),              -- �ش� ���Ƹ� ��ȣ
    BTITLE VARCHAR2(100) NOT NULL, -- ���� ���� ����
    BCONTENT CLOB,       -- ���� ���� ����
    BSTART DATE DEFAULT SYSDATE, -- ����� date/timestamp
    BEND DATE NOT NULL,          -- ������ date/timestamp
    BCOUNT NUMBER(3) DEFAULT 0,  -- ��û��
    BPEOPLE NUMBER(3) NOT NULL,  -- �ּ��ο�
    BACTI NUMBER(1) DEFAULT 0,   -- Ȱ��ȭ >> ������ 1
    FOREIGN KEY(CNUM) REFERENCES CIRCLE(CNUM));
    
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '���� ���� 7�� ���� ���ɸ� ����', '����ϰ� ���� �������� ���ɸ� ���� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
to_date('2018-08-05 11:00', 'yyyy-mm-dd hh24:mi'), to_date('2018-08-05 20:00', 'yyyy-mm-dd hh24:mi'), 
1, 5, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '�̹��ָ� ���ѻ� ������ ����', '�̹� �ָ��� ���ѻ� �����̿� ���ɸ� ���� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
to_date('2018-08-07 17:00', 'yyyy-mm-dd hh24:mi'), to_date('2018-08-07 19:00', 'yyyy-mm-dd hh24:mi'), 
1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '���� ���� 7�� ���� ���ɸ� ����', '����ϰ� ���� �������� ���ɸ� ���� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 19:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '�̹��ָ� ���ѻ� ������ ����', '�̹� �ָ��� ���ѻ� �����̿� ���ɸ� ���� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '���� ���� 8�� ���� ���� ����', '����ϰ� ���� �������� ���� ���� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 19:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '�̹������ ���� ��� ����', '�̹� �ָ��� ���ַ� ��� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);

insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '������ ���ѻ� ������ ����', '�̹� �ָ��� ���ѻ� �����̿� ���ɸ� ���� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '������ ���� ȭ���� ���� 8�� ���� ���� ����', '����ϰ� ���� �������� ���� ���� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 19:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '������ ���� ��� ����', '�̹� �ָ��� ���ַ� ��� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);

insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '������ ���ѻ� ������ ����', '�̹� �ָ��� ���ѻ� �����̿� ���ɸ� ���� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '������ ���� ȭ���� ���� 8�� ���� ���� ����', '����ϰ� ���� �������� ���� ���� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 19:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);
insert into bboard values(BBOARD_SEQ.NEXTVAL, 1, '������ ���� ��� ����', '�̹� �ָ��� ���ַ� ��� �����Ͻ� �е� �����մϴ�. 3���̻� ������ ���� �����մϴ�!',
sysdate, to_date('2018-09-06 20:00', 'yyyy-mm-dd hh24:mi'), 1, 10, 0);





commit;
-- to_date('09-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss')
select * from bboard;
select to_char(bend, 'yyyy-mm-dd hh:MM:ss') from bboard;
-- ���� ���� �Խ��� ��� (���۽ð� �ֱ� ������, ����� �� ��� ����)
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










