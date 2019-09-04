# 데이터 베이스

- 선언적, 결과 중심적 언어 <=> (프로그램 언어 - 절차적 언어)

- sql 문장의 키워드와 테이블명, 컬럼명 등은 대소문자 구별하지 않는다.
- 하지만 컬럼값은 대소문자를 구분한다.
- 오라클은 select구문, from문 까지가 필수다 (sql server, mysql은 select문만 필수)

# ANSI/ISO 표준 SQL의 기능

1. STANDARD JOIN 기능 추가, (CROSS, OUTER JOIN 등 새로운 FROM 절 JOIN 기능들
2. SCALAR SUBQUERY, TOP-N QUERY 등의 새로운 SUBQUERY 기능들
3. ROLLUP, CUBE, GROUPING SETS 등의 새로운 리포팅 기능
4. WINDOW FUNCTION 같은 새로운 개념의 분석 기능들

# DML

DQL - SELECT

추가 - INSERT

수정 - UPDATE

삭제 - DELETE

# DDL

생성 - CREATE

변경 - ALTER

삭제 - DROP

TABLE 관리 명령 - TRUNCATE - (TABLE에만 적용)

TABLE

VIEW

INDEX

SEQUENCE

원자성, 영속성, 독립성,

C:\app\student\product\11.2.0\dbhome_1\NETWORK\ADMIN

[Oracle client : $ORACLE_HOME\NETWORK\ADMIN\tnsanames.crcl]

=> host (ip), protocol, PORT, serviece명, 접속모드, 등의 정보 저장되어 있음.

# 리스너의 연결

cmd $ isnrctl status (리스너가 하나일 경우 리스너 명 생략 , 여러개일 경우 리스너 명 추가 기재)

1. 리스너가 orcl 파일의 사용자 정보를 확인하여 인증 여부를 가림.
2. os processor가 개별 사용자가 사용할 server process, 메모리, 세션을 배정

# server process (사용자 server)

[과정 중 사용되는 데이터들은 메모리 상에 업로드 된다. => 사용기록이 있는 데이터들은 재사용성이 높기 때문에 처리속도를 줄이기 위해 (튜닝가능)]

1. 리스너에 의해 할당된 자원을 통해 server processor가 사용자의 쿼리를 처리

2. select 문이 input될 경우

   1. syntax checking

   2. library cache 검색 ====> o 실행 (optimizer가 미리 생성했던 설계도)

      ​	=====> x 동일한 sql context 정보 조회

3. emp? 컬럼? 권한? (semantic checking)

4. optimizer (통계, 로그 정보를 활용하여 트랜젝션의 처리 과정을 설계) 저장됨

5. 설계된 경로를 server processor에게 전달

# 데이터의 구분

사용자 정보(user, 권한 등) =>메타 데이터 (시스템 카탈로그)

트랜젝션의 단위는 블락 (I/O)

(블락을 옮겨 다니는 HW/SW(논리적) 이동경로, 효율을 조정하는 것이 DB튜닝)

# 테이블 조회

SELECT table_name FROM user_tables;

desc tab; ( user_tables의 ALIAS 값 tab)

select tname from tab;

select sysdate from dual; => 현재 시간 출력