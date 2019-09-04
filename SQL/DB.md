```
----------------------------------------------------------#
-------------------------------------------------- DDL 실습#
----------------------------------------------------------#

-- 테이블 생성
CREATE TABLE TEAM_TEMP
AS SELECT * FROM TEAM;

-- 테이블 정보 요약본 출력
DESC TEAM_TEMP;

-- 테이블 정보 변경 (ADD)
ALTER TABLE PLAYER
ADD (ADDRESS VARCHAR2(80));

-- 테이블 정보 변경 (DROP)
ALTER TABLE PLAYER
DROP COLUMN ADDRESS;

-- 테이블 정보 변경 (MODIFY)
ALTER TABLE TEAM_TEMP
MODIFY (ORIG_YYYY VARCHAR2(8) DEFAULT '20020129' NOT NULL);

-- 테이블 정보 변경 (RENAME)
ALTER TABLE PLAYER
RENAME COLUMN TEMP_ID TO PLAYER_ID;

DESC PLAYER;

-- 테이블 정보 변경 (ADD CONSTRAINT 제약조건 설정)
ALTER TABLE PLAYER
ADD CONSTRAINT PLAYER_FK
FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID);

-- 테이블 정보 변경 (ADD CONSTRAINT 제약조건 해제)
ALTER TABLE PLAYER
DROP CONSTRAINT PLAYER_FK;

-- 이름 변경
RENAME TEAM TO TEAM_BACKUP;
RENAME TEAM_BACKUP TO TEAM;

-- 테이블 값 제거 (DROP TRUNCATE)
DROP TABLE PLAYER;
TRUNCATE TABLE PLAYER;
--TRUNCATE는 가볍다는 장점이 있지만 복구가 불가능하다.

----------------------------------------------------------#
-------------------------------------------------- DML 실습#
----------------------------------------------------------#

-- 들어갈 자리를 적고 일부 정보만 입력 가능)
INSERT INTO PLAYER (PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, HEIGHT,WEIGHT,BACK_NO)
VALUES ('2002007','박지성','K07','MF',178,73,7);

-- 들어갈 자리 적지 않고 모든 데이터 기재하여 입력 가능 (값으로 ''싱글 쿼테이션 사용 가능)
INSERT INTO PLAYER
VALUES ('2002010','이청용','K07','','BlueDragon','2002','MF','17',NULL,NULL,'1',180,69);

-- 전체 칼럼이 다 변경되었다.
UPDATE PLAYER
SET BACK_NO = 99;

--DELETE FROM PLAYER; WHERE 조건을 주지 않는 이상 모든 행이 삭제된다.

--SELECT ALL(중복 허용)과 SELECT DISTINCT(중복 불허) 두가지 옵션이 있다.)
SELECT PLAYER_ID FROM PLAYER;

--ALIAS는 컬럼별칭을 붙이는 방법으로 AS 뒤에 별명을 써주거나 더블 쿼테이션을 이용한다. 
--더블 쿼테이션 쓸 경우(대소문자 구별, 공백 가능)
--SELECT PLAYER_ID AS 선수명 FROM PLAYER;
--SELECT PLAYER_ID "선수 이름" FROM PLAYER;

--(),*,/,+,-등의 연산식은 (컬럼이름 연산자 컬럼이름) AS 별칭 형식으로 사용한다.

-- ||을 이용하여 문자열을 합성한다. (CONCAT(STRING1, STRING2))형식도 가능, 컬럼||'문자열' 형식이나 컬럼||컬럼 형식을 사용한다.
SELECT PLAYER_NAME || '선수', HEIGHT || 'cm' 
FROM PLAYER;

----------------------------------------------------------#
-------------------------------------------------- TCL 실습#
----------------------------------------------------------#

--DML 사용 후에는 TCL을 사용해준다. (COMMIT, ROLLBACK)
--다음은 SAVEPOINT 명령어다. SAVEPOINT를 지칭할 변수명을 함께 서준다.
SAVEPOINT SVPT1;
ROLLBACK TO SVPT1; --이처럼 시행하면 ROLLBACK을 SAVEPOINT까지만 시행한다. (대형 트랜젝션의 경우, 에러가 나기 전까지만 되돌릴 수 있다.)


----------------------------------------------------------#
-------------------------------------------------- WHERE절#
----------------------------------------------------------#

--WHERE절--

--기본적인 연산자들 + SQL 연산자 ([NOT] BETWEEN A AND B) - A~B의 사이에 [불]포함을 의미한다.
--([NOT]IN (리스트)) 리스트에 있는 값중 하나와 맵핑되면 해당 판정
-- 조선으로서의 문자열은 항상 ' '로 감싼다.
-- LIKE '비교문자열' (%(0개 이상),_(1개)를 사용한다)
-- 조건에 ROWNUM 을 활용할 수 있다. (행 번호로 조건 기입 가능)
```