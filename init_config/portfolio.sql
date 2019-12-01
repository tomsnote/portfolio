--SELECT 'DORP TABLE "'||TABLE_NAME||'" CASCADE CONSTRAINTS;' FROM USER_TABLES;
--
--BEGIN
--    for c in (SELECT TABLE_NAME FROM USER_TABLES)loop
--        EXECUTE IMMEDIATE('DROP TABLE '||c.TABLE_NAME||' CASCADE CONSTRAINTS');
--    end loop;
--END;
-- 화면크기설정법
--SET LINESIZE 300;
--SET PAGESIZE 100;
---------------------초기 설정-----------------------
--관리자 로그인
--cmd 창에서 관리자 로그인 후 
--@portfoilo.sql 엔터 치면된다.
--sqlplus / as sysdba 
--SELECT * FROM DBA_DATA_FILES; --datafiles 확인 쿼리
-- 테이블스페이스 생성
DROP TABLESPACE portfolio 
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

CREATE TABLESPACE portfolio
DATAFILE '\portfolio\flight_hotel_reserve\init_config\portfolio.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 10M;

-- port 유저 생성
DROP USER port CASCADE;
CREATE USER port IDENTIFIED BY 1 DEFAULT TABLESPACE portfolio;
GRANT CONNECT, DBA, RESOURCE TO port;
CONN port/1;

-- 테이블 삭제
DROP TABLE seats;
DROP TABLE flight_reserve;
DROP SEQUENCE reserve_seq;
DROP TABLE members;
DROP TABLE flights;
DROP VIEW view_flight_reserve;
DROP TABLE hotel_reserve;
DROP TABLE hotels;

---------------------테이블 생성 및 속성 추가-----------------------

-- 회원 테이블
CREATE TABLE members(
id          VARCHAR2(20),
pwd         VARCHAR2(20),
fname_ko    VARCHAR2(20),
lname_ko    VARCHAR2(20),
fname_en    VARCHAR2(20),
lname_en    VARCHAR2(20),
nationality VARCHAR2(10),
birth       DATE,
gender      CHAR(1),
address     VARCHAR2(100),
email       VARCHAR2(40),
phone       VARCHAR2(20),
useyn       CHAR(1) DEFAULT 'Y',
regdate     DATE DEFAULT sysdate,
authority   CHAR(1) DEFAULT 'N',
CONSTRAINT pk_id PRIMARY KEY(id),
CONSTRAINT chk_use CHECK(useyn IN('Y','N')),
CONSTRAINT chk_authority CHECK(authority IN('Y', 'N')),
CONSTRAINT chk_gender CHECK(gender IN('M', 'W'))
);



COMMENT ON TABLE members IS '회원';
COMMENT ON COLUMN members.id IS '아이디';
COMMENT ON COLUMN members.pwd IS '비밀번호';
COMMENT ON COLUMN members.fname_ko IS '성';
COMMENT ON COLUMN members.lname_ko IS '이름';
COMMENT ON COLUMN members.nationality IS '국적';
COMMENT ON COLUMN members.address IS '주소';
COMMENT ON COLUMN members.email IS '이메일';
COMMENT ON COLUMN members.phone IS '전화번호';
COMMENT ON COLUMN members.useyn IS '''N'' 탈퇴여부';
COMMENT ON COLUMN members.regdate IS '가입일';
COMMENT ON COLUMN members.authority IS '''Y''관리자권한';

INSERT INTO members(id, pwd, fname_ko, lname_ko, fname_en, lname_en, nationality, birth, gender, address, email, phone)
        VALUES('test', '1', '', '테스트', '', 'test', '한국', TO_DATE('19980101','YYYYMMDD'), 'M','test home', 'test@email.com', '010-7777-7777');
INSERT INTO members(id, pwd, fname_ko, lname_ko, fname_en, lname_en, nationality, birth, gender, address, email, phone, authority) 
    VALUES('admin','1', '', '관리자', '', 'admin', '한국', TO_DATE('20000101','YYYYMMDD'), 'M', '관리자 집', 'admin@email.com', '010-0000-0000', 'Y');


-- 항공편 테이블
CREATE TABLE flights(
flight VARCHAR2(15),
airline VARCHAR2(30),
departure_city VARCHAR2(20),
arrival_city VARCHAR2(20),
departure_date date,
arrival_date date,
departure_time VARCHAR2(10),
arrival_time VARCHAR2(10),
CONSTRAINT pk_flight PRIMARY KEY(flight)
);


@flight_insert.sql;



-- 좌석 테이블
CREATE TABLE seats(
seat_num    VARCHAR2(10), 
seat_type   VARCHAR2(22),
f_price     INTEGER,
reserve_yn  CHAR(1) DEFAULT 'N',
flight      VARCHAR2(15),
CONSTRAINT pk_seat_num PRIMARY KEY(seat_num),
CONSTRAINT chk_reserve_yn CHECK(reserve_yn IN('Y','N')),
CONSTRAINT fk_flight FOREIGN KEY(flight) REFERENCES flights(flight)
);

@seat_insert.sql;

-- 항공편예약 
CREATE TABLE flight_reserve(
f_reserve_code  NUMBER,
f_reserve_name  VARCHAR2(20),
f_reserve_date  DATE,
passport        VARCHAR2(30),
f_comment       VARCHAR2(300),
seat_type       VARCHAR2(22),
seat_num        VARCHAR2(10),
id              VARCHAR2(20),
flight          VARCHAR2(15),
CONSTRAINT pk_f_reserve_code PRIMARY KEY(f_reserve_code),
CONSTRAINT fk_id FOREIGN KEY(id) REFERENCES members(id),
CONSTRAINT fk_flight_reserve FOREIGN KEY(flight) REFERENCES flights(flight)
);
CREATE SEQUENCE reserve_seq START WITH 1 INCREMENT BY 1 NOCYCLE NOORDER NOCACHE;





CREATE OR REPLACE VIEW view_flight_reserve
AS SELECT 
fr.*,
f.airline,f.arrival_city, f.arrival_date, f.arrival_time, f.departure_city, f.departure_date, f.departure_time,
s.f_price
FROM flight_reserve fr, flights f, seats s
WHERE s.reserve_yn='Y' AND f.flight=fr.flight AND f.flight=s.flight;

--SELECT * FROM flights f, seats s
--		WHERE f.departure_city='인천' AND f.arrival_city='홍콩'
--		AND s.seat_type ='일등석'
--		AND f.departure_date = to_date('20191111', 'YYYYMMDD');
--select * from view_flight_reserve;
--
--
--
--
--SELECT * FROM (select * from flights
--		WHERE departure_city='인천' AND arrival_city='보라카이' AND seats_type ='일반석'
--		AND departure_date >= to_date('20191111', 'YYYYMMDD'))
--where (departure_time='9:00' and airline='아시아나항공') or (airline='아시아나항공') or (departure_time='9:00');
--
--
--COMMIT;
--select distinct departure_city from flights where departure_city = '제주';
--
--SELECT distinct arrival_city FROM flights
--where departure_city = '런던';
--SELECT distinct seat_type FROM seats;
--
--SELECT DISTINCT to_char(departure_date, 'DD')as dd FROM flights
--where departure_city='인천' and arrival_city='홍콩'
--order by dd asc;
