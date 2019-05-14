SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;

-- ���� ���̺� ����
DROP TABLE TBL_MEMBER PURGE;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

-- ������ ����
PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.

-- ���� ������ ����
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

--------------------------------------------------------------------------------------------------------------------------------

--�� �ǽ� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ������ ����
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-1111-1111');
--> �� �� ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-1111-1111')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� ���̺� ��ü ��ȸ ������ ����
SELECT SID, NAME, TEL
FROM TBL_MEMBER;
--> �� �� ���� 
SELECT SID, NAME, TEL FROM TBL_MEMBER
;

--�� �ο� �� Ȯ�� ������ ����
SELECT COUNT(*)
FROM TBL_MEMBER;
--> �� �� ����
SELECT COUNT(*) FROM TBL_MEMBER
;

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ������ �߰� �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '���Ѿ�', '010-2222-2222');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.