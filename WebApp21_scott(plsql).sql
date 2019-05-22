SELECT USER
FROM DUAL;
--==>> SCOTT

DECLARE
    V_CNT       NUMBER(9)       := 1;
    V_NAME      VARCHAR2(30);
    V_PWD       VARCHAR2(20);
    V_EMAIL     VARCHAR2(50);
    V_SUBJECT   VARCHAR2(100);
    V_CONTENT   VARCHAR2(4000);
    V_IPADDR    VARCHAR2(20);
    V_HITCOUNT  NUMBER;
    V_CREATED   DATE;
BEGIN
    LOOP
        EXIT WHEN V_CNT > 811;
        
        V_CNT := V_CNT+1;
        
        IF (MOD(V_CNT, 5)=0) THEN
            V_PWD := 'java006$';
            V_CONTENT := '���� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.164';
        ELSIF (MOD(V_CNT, 3)=0) THEN
            V_PWD := 'java004$';
            V_CONTENT := '���� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.154';
        ELSIF (MOD(V_CNT, 7)=0) THEN
            V_PWD := 'java007$';
            V_CONTENT := 'ȭ�� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.172';
        ELSE
            V_PWD := 'java008$';
            V_CONTENT := '���� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.169';
        END IF;
        
        V_NAME := '������' || LTRIM( TO_CHAR(V_CNT) );
        V_SUBJECT := '�Խù� �ۼ�' || LTRIM( TO_CHAR(V_CNT) );
        
        IF (MOD(V_CNT,2)=0) THEN
            V_CREATED := TO_DATE('2019-05-20', 'YYYY-MM-DD');
            V_EMAIL := 'apple@test.com';
            V_HITCOUNT := 27;
        ELSIF (MOD(V_CNT,3)=0) THEN
            V_CREATED := TO_DATE('2019-05-21', 'YYYY-MM-DD');
            V_EMAIL := 'test@test.com';
            V_HITCOUNT := 32;
        ELSIF (MOD(V_CNT,4)=0) THEN
            V_CREATED := TO_DATE('2019-05-19', 'YYYY-MM-DD');
            V_EMAIL := 'study@test.com';
            V_HITCOUNT := 46;
        ELSE
            V_CREATED := TO_DATE('2019-05-22', 'YYYY-MM-DD');
            V_EMAIL := 'morning@test.com';
            V_HITCOUNT := 72;
        END IF;
        
        INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
        VALUES(V_CNT, V_NAME, V_PWD, V_EMAIL, V_SUBJECT, V_CONTENT, V_IPADDR, V_HITCOUNT, V_CREATED);
        
    END LOOP;
END;
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_BOARD
ORDER BY NUM;