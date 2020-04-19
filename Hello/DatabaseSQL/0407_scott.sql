SELECT ename, sal, sal+nvl(comm,0)as total_sal FROM emp;

--����� �Լ��� ����Ͽ� ���ο� �ݷ��� ���� �ܿ� ��Ī�� ����Ѵ�. as (��Ī) 
--as�� ������ ���� �ϴ�.

--�̸� �����Ϳ� ���������͸� �ٿ��� ���� �� �ֵ��� 
--������� ��Ī
SELECT  ename ||'['||job||']' ename,sal, sal+nvl(comm,0)as total_sal FROM emp;

--��� ���̺�(emp)���� ������ ��� (JOB)
--all �� ����� ���� ��µȴ��� all�� �⺻���̾ ���� ����
SELECT all job FROM emp;
--DISTINCT  all�̶� ������ �ߺ��� ���� �ȴ�.
SELECT DISTINCT job FROM emp;

SELECT deptno FROM emp;
SELECT DISTINCT deptno FROM emp;

--�μ� ���ڵ�, ������ �ߺ� ���� job deptno �ΰ��� ���� ������ �ߺ� ����
SELECT DISTINCT job ,deptno  FROM emp;

--����1 20�� �μ��� ��� ��ȣ, �̸�, �μ���ȣ�� ����ϼ���
SELECT empno,ename,deptno
FROM emp
WHERE deptno=20;
--����2  �Ի����� 81/01/01���� 81/06/09�� ����� �����ȣ, �̸�, �Ի����� ���
--between ���� �Ի��� x�� ~ y������
--where hiredate BETWEEN 'x' AND 'y';
SELECT empno,ename,hiredate
FROM emp
WHERE hiredate BETWEEN '81/01/01' and '81/06/09' ;
-- ����3- �������� salesman, clerk�� ������� �̸��� ������ ���
--���� �����ʹ� �ҹ��� �빮�� ���� �Ѵ�.
SELECT ename,job
FROM emp
WHERE job='SALESMAN' OR job='CLERK';
-- ����4- ������ president�̰�/ �޿��� 1500�̻��̰ų� ������ salesman�� ����� ������ ���
SELECT *
FROM emp
WHERE (sal>=1500 OR job='SALESMAN') AND job='PRESIDENT';  
--����4- (������ president�̰� �޿��� 1500�̻��̰ų�) ������ salesman�� ����� ������ ���
SELECT *
FROM emp
WHERE (job='PRESIDENT' AND sal>=1500) OR job='SALESMAN';   

-- 5- ������ president �Ǵ� salesman�̰� �޿��� 1500�̻��� ����� ������ ���
SELECT *
FROM emp
WHERE (job='PRESIDENT' OR job='SALESMAN') AND sal>=1500 ;  

-- 6- Ŀ�̼�(comm)�� ���� ����� �̸�, �޿�, Ŀ�̼��� ���
SELECT ename,sal,comm
FROM emp
WHERE nvl(comm,0)=0;

--  7- �����, �޿�, Ŀ�̼�, �ѱ޿�( �޿� + Ŀ�̼�)�� ���
SELECT ename,sal,comm,sal+nvl(comm,0) as �ѱ޿�
FROM emp;
-- 8- �̸� A�� �����ϴ� ����� ���
SELECT ename
FROM emp
WHERE ename LIKE 'A%';

-- 9- �̸��� �ι�° ���ڰ� L�� ����� ���
SELECT ename
FROM emp
WHERE ename LIKE '_L%';

-- 10- �̸��� L�� �� �� �̻� ���Ե� ����� ��� // L�� 2���� ������ ���Եȴٸ� L�� 3���ΰŵ� 4���ΰŵ� ����� �ȴ�. 
SELECT ename
FROM emp
WHERE ename LIKE '%L%L%';

-- 11- Ŀ�̼�(COMM)�� NULL�� �ƴ� ����� ��� ������ ���
SELECT *
FROM emp
WHERE comm is NOT NULL;

-- 12- ���ʽ��� �޿����� 10%�� ���� ��� ����� ���� �̸�, �޿�, ���ʽ��� ���
SELECT ename,sal,comm
FROM emp
WHERE comm>sal+sal/10;

-- 13- ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� �ƴ� ��� ����� ������ ���
--not in => not ( col name in (x,y));
SELECT *
FROM emp
WHERE (job='CLERK' OR job='ANALYST') AND not (sal  in (1000,3000,5000));

-- 14- �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ���
SELECT *
FROM emp
WHERE deptno = 30 OR mgr=7782;

--�ڱ����� (��� : 8000, �̸� : ȫ�浿, ���� : ������) �Է�
-----------------------------------------------------------INSERT INTO emp(ENAME,job,deptno)  VALUES ('ȫ�浿','������',8000);

--�μ���ȣ�� ����
SELECT *
FROM emp
--WHERE
ORDER BY deptno DESC;
--asc : �������� 10~ 40
--desc : �������� 
--�μ���ȣ�� �����ϵ� �ްܰ� ���� ������� ���
SELECT *
FROM emp
ORDER BY deptno ASC,sal DESC;

--��������
-- �ֱ� �Ի��Ѽ����� �����, �޿�, �Ի����ڸ� ���
SELECT ename,sal,hiredate
FROM emp
ORDER BY hiredate DESC;
-- Ŀ�̼��� ���� ������ ����
--  (��, Ŀ�̼��� ������ ���� ���߿� ��µǵ��� )
SELECT *
FROM emp
ORDER BY nvl(comm,0) DESC; --���� 0 �� �ƴ϶� null�� �������� �߷��ϰ� ������ null ���� -1�� �ָ� �ȴ�.
-- �μ���ȣ�� ������ �� �μ���ȣ�� ���� ���� �޿��� ���������� �����Ͽ� �����ȣ, �̸�, ����, �μ���ȣ, �޿��� ���
SELECT empno,ename,job,deptno,sal
FROM emp
ORDER BY deptno ASC,sal DESC;

--�Լ�===========================================================================
--�����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���
SELECT ename,sal,ROUND(sal/12,-2) as "����"
FROM emp;
 
--�����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
SELECT ename,sal,TRUNC(sal*3.3/100,-1) as "����"
FROM emp;

 -- smith�������� �����ȣ, ����, ������(�ҹ���) ���
SELECT empno,ename,lower(job) as job
FROM emp
where ename = upper('smith');
          

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ��빮��)�� ���
SELECT empno,INITCAP(ename),INITCAP(job)
FROM emp;
          

-- �̸��� ù���ڰ� ��K������ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
SELECT empno,ename,job,sal,deptno
FROM emp
where  SUBSTR(ename,1,1) between 'K' and 'Y'
ORDER BY ename;

--info_tab ���̺��� �ֹι�ȣ���� �⵵�� ����ϱ�
SELECT subSTR(jumin,1,2)as "����⵵"
FROM info_tab;

--info_tab ���̺��� �ֹι�ȣ���� ������ ����ϱ�
SELECT decode(SUBSTR(jumin,8,1),1,'����',2,'����') as ����
FROM info_tab;

-- �̸��� 5���� �̻��λ������ ���
SELECT *
FROM emp
WHERE LENGTH(ename)>=5;
  

-- �̸��� 15�ڷ� ���߰����ڴ� ���ʿ� �����ʿ��� ��*���� ä���
SELECT RPAD(ename,15,'*')
FROM emp;
 

-- �޿��� 10�ڷ� ���߰����ڴ� �����ʿ� ���ʿ� ��-���� ä���
SELECT LPAD(sal,10,'-')
FROM emp;
 

--���� ������ ����
/*
 select  '-' || trim(' �̼��� ')|| '-' as col1,
 '-'|| ltrim(' �̼��� ') || '-' as col2,
 '-'|| rtrim(' �̼��� ') || '-' as col3 from dual;
*/
 
-- �޿��� ���ڿ��� �������̻�����ĥ�ȱ��� ���ڷ� ��ü
SELECT TRANSLATE(sal,'0123456789','�����̻�����ĥ�ȱ�')SAL
FROM emp;
        
-- �޿��� ���ڿ��� 0����$���� �ٲپ� ���
-- �߰� ������ ������ �� ���
select REPLACE(sal,0,'$')sal
FROM emp;

--������ ����� ���̺� �ȸ���� �ٷ� ����ϰ� ���� �� dual�̶�� �������̺� ���
SELECT sysdate
FROM dual;
 
SELECT 1+2
FROM dual;

-- �� �� ���� ���� TRIM ,RTRIM : ���� �� ���� ���� ,LTRIM : ���� ���� ����
SELECT TRIM('   ȫ  ��    ��  ') FROM dual;

--�߰� ���鵵 ���� replace
SELECT replace('   ȫ     ��  ��   ',' ',null) FROM dual;

--��¥�� �Լ�
-- ������� �ٹ��� ���� ���� ��� ������ ���
SELECT *
FROM emp
ORDER BY SYSDATE-nvl(hiredate,SYSDATE) DESC;
          

-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���
--mod ���� ������ ������ �������� �ƴϴ�. �Ҽ������� ���´�.
SELECT TRUNC(((sysdate-hiredate)/7),0)||'��' as week,CEIL(MOD((sysdate-hiredate),7))||'��' as days
FROM emp;

-- 10�� �μ��� ����� ��������� �ٹ� ������ ���
SELECT ename, TRUNC(months_between (sysdate,hiredate),0) as "����"
FROM emp
where deptno=10;
          

-- ���� ��¥���� 3�������� ��¥ ���ϱ�
-- select  add_months( sysdate, 3 ) as mydate from dual;


-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
-- ������ �� �ν� �ϱ⿡ �ѱ۷� �Է��ؾ��Ѵ�.
SELECT next_day(sysdate,'��') as "�����ֿ�����"FROM dual ;
          

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
-- �ٸ� ��¥�� ������ ���� ���ϰ� ������ ���� ��¥�� �Է����ָ�ȴ�. '��/��/��'
--SELECT last_day('2020/08/06')as"4��������" FROM dual ;
SELECT last_day(sysdate)as"4��������" FROM dual ;
  
  
--��ȯ ����
-- �Ի����ڿ��� �Ի�⵵�� ���
-- �⵵,��,�� TO char (������,'YYYY'),'MM','DD'
SELECT ename,hiredate,TO_CHAR(hiredate,'YYYY') hire_year,TO_CHAR(hiredate,'MM') hire_month,TO_CHAR(hiredate,'DD') hire_days
FROM emp;
          

-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
-- TO_CHAR ���
SELECT TO_CHAR(hiredate,'YYYY"��" MM"��" DD"��"')as hiredate
FROM emp;
          

-- 1981�⵵�� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE TO_CHAR(hiredate,'YYYY')=1981;
 

-- 5���� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE TO_CHAR(hiredate,'MM')=05;

-- 81�� 2���� �Ի��� ��� �˻�
SELECT *
FROM emp
--WHERE TO_CHAR(hiredate,'YYYY')=1981 AND TO_CHAR(hiredate,'MM')=02 ;
WHERE TO_CHAR(hiredate,'YYYYMM')=198102; 
-- 81�� �Ի����� ���� ��� �˻�
SELECT *
FROM emp
WHERE not TO_CHAR(hiredate,'YYYY')=1981;
-- 81�� �Ϲݱ⿡ �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE TO_CHAR(hiredate,'YYYY')=1981 AND TO_CHAR(hiredate,'MM')>06 ;

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
-- �����ʹ� ���� �״�� �̳� to_char�� ���� ��µǴ� ���¿� ��ȭ�� �ذŴ�
-- �˳���� ���� ����.
SELECT ename,sal,to_char(sal,'$999,999,999') as dollar
FROM emp;

