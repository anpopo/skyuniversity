show user;
select * from tab;

------------------------------------------------------
-- 학적 테이블 생성
create table tbl_school_reg
(
regSeq      number       not null     
,status     varchar2(20) not null
,constraint PK_tbl_schoolreg_regSeq  primary key(regSeq)
)
insert into tbl_school_reg(regSeq, status)
values(tbl_school_reg_seq.nextval, '재학');
commit
-- 학적 시퀀스 생성
create sequence tbl_school_reg_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
------------------------------------------------------

------------------------------------------------------
-- 학과 테이블 생성
create table tbl_dept
(
deptSeq     number not null
,deptName   varchar2(20) not null
,constraint PK_tbl_dept_deptSeq primary key(deptSeq)
)
-- 학과 시퀀스 생성
create sequence tbl_dept_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 학과 테이블 데이터 insert
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '경영학과');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '컴퓨터공학부');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '국어국문학과');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '영어영문학과');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '심리아동학부');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '경제학과');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '수리금융학과');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '응용통계학과');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '정보통신학부');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '특수체육학과');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '사회복지학과');
insert into tbl_dept(deptSeq, deptName)
values(tbl_dept_seq.nextval, '교양');

select *
from tbl_dept;

commit
------------------------------------------------------

------------------------------------------------------
-- 학생 테이블 생성
create table tbl_member
(memberNo            number                 not null   -- 학번
,pwd                 VARCHAR2(200)          not null   -- 비밀번호
,name                varchar2(20)           not null   -- 성명
,mobile              VARCHAR2(200)          not null   -- 연락처
,email               varchar2(200)          not null   -- 이메일
,birth               varchar2(20)                      -- 생년월일
,jubun               varchar2(200)          not null   -- 주민번호
,engName             varchar2(30)                      -- 영문성명
,chinaName           varchar2(30)                      -- 한자성명
,img                 VARCHAR2(200)                     -- 사진
,grade               number(5)                         -- 학년
,totalSemester       number(5)                         -- 현재이수학기
,enterDay            DATE default sysdate              -- 입학날짜
,graduateDay         DATE                              -- 졸업날짜
,postcode            varchar2(5)                       -- 우편번호
,address             varchar2(200)                     -- 주소
,detailaddress       VARCHAR2(50)                      -- 상세주소
,extraaddress        VARCHAR2(50)                      -- 참고주소
,absenceCnt          number(2) default 0               -- 휴학횟수
,graduateok          number(2) default 0               -- 졸업가능여부
,fk_regSeq           number              not null      -- 학적번호
,fk_deptSeq          number              not null      -- 학과번호
,constraint PK_tbl_member_memberNo primary key(memberNo)
,constraint FK_tbl_member_regSeq foreign key(fk_regSeq)
                                 references tbl_school_reg(regSeq)
,constraint FK_tbl_membert_deptSeq foreign key(fk_deptSeq) 
                                   references tbl_dept(deptSeq) 
);

desc tbl_member

-- 학생 테이블 시퀀스 생성
create sequence tbl_member_seq
start with 100
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 학생 테이블 데이터 insert
insert into tbl_member(memberNo, pwd, name, mobile, email, birth, jubun, fk_regSeq, fk_deptSeq)
values(tbl_member_seq.nextval, 'qwer1234$', '홍길동', '010-1234-5678', 'hongkd@naver.com', '1997-01-27', '970127112 5678', '1', '1');
insert into tbl_member(memberNo, pwd, name, mobile, email, birth, jubun, fk_regSeq, fk_deptSeq)
values(tbl_member_seq.nextval, 'qwer1234$', '이순신', '010-9898-0101', 'leess@naver.com', '1995-03-11', '9503111324148', '1', '2');
insert into tbl_member(memberNo, pwd, name, mobile, email, birth, jubun, fk_regSeq, fk_deptSeq)
values(tbl_member_seq.nextval, 'qwer1234$', '안세형', '010-1122-9988', 'anpopo@naver.com', '1990-09-24', '9009241152119', '1', '11');
insert into tbl_member(memberNo, pwd, name, mobile, email, birth, jubun, fk_regSeq, fk_deptSeq)
values(tbl_member_seq.nextval, 'qwer1234$', '최은지', '010-2246-6435', 'ejejc@naver.com', '1997-01-24', '9701241455161', '1', '2');
insert into tbl_member(memberNo, pwd, name, mobile, email, birth, jubun, fk_regSeq, fk_deptSeq)
values(tbl_member_seq.nextval, 'qwer1234$', '권오윤', '010-2156-6331', 'ky@naver.com', '1998-04-14', '9804141445351', '1', '2');
-- 학생 테이블 전체 select
select *
from tbl_member

update tbl_member set grade = 1 where memberno='101'
update tbl_member set CURRENTSEMESTER = 1 where memberno='101'
commit

ALTER TABLE TBL_MEMBER DROP COLUMN totalsemester;
ALTER TABLE TBL_MEMBER ADD CURRENTSEMESTER NUMBER(2);

select currentSemester, name, memberNo, deptName
from tbl_member M
inner join tbl_dept D
on M.fk_deptseq = D.deptseq
where memberno = '101'
------------------------------------------------------

------------------------------------------------------ 
-- 증명서 테이블 생성
create table tbl_certificate
(seq                number           not null
,kind               varchar2(20)
,grantstatus        number           default 0 
,grantdate          date             default sysdate
,returnreason       varchar2(200)
,fk_memberno        number
,constraint PK_tbl_certificate_seq primary key(seq)
,constraint FK_tbl_certificate_memberno foreign key(fk_memberno) 
                                   references tbl_member(memberno)
);

-- 증명서 테이블 시퀀스 생성
create sequence tbl_certificate_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
------------------------------------------------------ 

------------------------------------------------------ 
-- 수강 테이블 생성
create table tbl_course
(
courseno        number          not null
,semester       number(10)      not null
,courseyear     varchar2(10)    not null    
,score          varchar2(10)
,recourse       number(5)       default 0
,fk_memberno    number          not null
,fk_subjectNo   varchar2(20)    not null
,constraint PK_tbl_course_courseno primary key(courseno)
,constraint FK_tbl_course_memberno foreign key(fk_memberno) 
                                   references tbl_member(memberno)
,constraint FK_tbl_course_subjectNo foreign key(fk_subjectNo) 
                                   references tbl_subject(subjectNo)                                   
);

-- 수강 테이블 시퀀스 생성
create sequence tbl_course_seq
start with 10
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from tbl_course

insert into tbl_course(courseno,semester,courseyear, fk_memberno, fk_subjectNo)
values(tbl_course_seq.nextval, '1', '2021', '105','NE104')
insert into tbl_course(courseno,semester,courseyear, fk_memberno, fk_subjectNo)
values(tbl_course_seq.nextval, '1', '2021', '106','NE104')
insert into tbl_course(courseno,semester,courseyear, fk_memberno, fk_subjectNo)
values(tbl_course_seq.nextval, '1', '2021', '106','NE104')
insert into tbl_course(courseno,semester,courseyear, fk_memberno, fk_subjectNo)
values(tbl_course_seq.nextval, '1', '2021', '101','EB103')

ALTER TABLE tbl_course ADD CONSTRAINT UQ_tbl_course UNIQUE(semester, courseyear, fk_memberno,fk_subjectNo );

select *
from tbl_subject
------------------------------------------------------ 

------------------------------------------------------ 
-- 건물 테이블 생성
create table tbl_building
(
buildno      number          
,buildname   varchar2(20)    not null
,constraint PK_tbl_tbl_building_buildno primary key(buildno)
);
-- 건물 테이블 시퀀스 생성
create sequence tbl_building_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into tbl_building(buildno, buildname)
values(tbl_building_seq.nextval, '60주년기념관');
insert into tbl_building(buildno, buildname)
values(tbl_building_seq.nextval, '만우관');
commit
------------------------------------------------------ 

------------------------------------------------------ 
-- 강의실 테이블 생성
create table tbl_classroom
(
classno         number not null
,fk_buildno     number not null
,constraint PK_tbl_tbl_classroom_classno primary key(classno)
,constraint FK_tbl_classroom_buildno foreign key(fk_buildno) 
                                   references tbl_building(buildno)
);

insert into tbl_classroom(classno, fk_buildno)
values('18101', '1')
insert into tbl_classroom(classno, fk_buildno)
values('18102', '1')
insert into tbl_classroom(classno, fk_buildno)
values('18103', '1')
insert into tbl_classroom(classno, fk_buildno)
values('18104', '1')
insert into tbl_classroom(classno, fk_buildno)
values('18105', '1')
insert into tbl_classroom(classno, fk_buildno)
values('18201', '1')
insert into tbl_classroom(classno, fk_buildno)
values('18202', '1')
insert into tbl_classroom(classno, fk_buildno)
values('18203', '1')
insert into tbl_classroom(classno, fk_buildno)
values('18204', '1')
insert into tbl_classroom(classno, fk_buildno)
values('18205', '1')
commit
------------------------------------------------------

------------------------------------------------------
-- 교수 테이블 생성
create table tbl_professor
(
professorno      number         -- 교수번호
,phonenum        varchar2(20)   -- 전화번호
,name            varchar2(20)   -- 이름
,roomno          number(5)      -- 교수실번호
,email           varchar2(20)   -- 이메일
,constraint PK_tbl_professor_professorno primary key(professorno)
)

-- 교수 테이블 시퀀스 생성
create sequence tbl_professor_seq
start with 10
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0574', '염건', '8414', 'fish@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0575', '오창호', '8415', 'compino@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0576', '이건범', '8413', 'kblee@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0639', '강영경', '18415', 'ykang@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0635', '김성기', '18404', 'skkim@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0644', '류승택', '18407', 'stryoo@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0636', '장재건', '18405', 'jchang@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0403', '김동식', '8203', 'nolme@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0405', '한재영', '8204', 'hanjjyy@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0404', '유문선', '8228', 'msyouu@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0417', '박미선', '8216', 'mspark@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0416', '서강목', '8307', 'jjyoung@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0419', '이향미', '8212', 'hyangmilee@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0392', '강순원', '8329', 'kangsw@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0671', '오현숙', '8224', 'hyunsookoh@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0673', '박은희', '3420', 'psypeh@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0502', '강남훈', '8409', 'nkang@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0506', '성낙선', '8331', 'nssung@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0504', '정건화', '8408', 'gunna@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0604', '박기현', '7204', 'ghpark@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0606', '윤성식', '7310', 'ssyun@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0605', '양춘우', '7314', 'chyang@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0615', '박동련', '7205', 'drpark@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0614', '이승천', '7206', 'seung@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0616', '변종석', '7208', 'jsbyun@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0654', '김현경', '18514', 'hkim@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0659', '손승일', '18504', 'saisonh@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0657', '이경옥', '18512', 'golee@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0625', '민경훈', '8829', 'minkh@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0626', '조규청', '8222', 'kcc@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0624', '서연태', '8202', 'syt@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0518', '김예랑', '8312', 'yrkim@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0516', '주경희', '8315', 'macoj2@hs.ac.kr')
insert into tbl_professor(professorno, phonenum, name, roomno, email) 
values(tbl_professor_seq.nextval, '031-379-0517', '장익현', '8314', 'skking@hs.ac.kr')
commit

select *
from tbl_professor
------------------------------------------------------

------------------------------------------------------
-- 과목 테이블 생성
create table tbl_subject
(
subjectNo           varchar2(20)    not null    -- 과목코드
,subjectName        varchar2(20)    not null    -- 과목명
,credits            number(2)       not null    -- 학점
,grade              number(5)       not null    -- 이수학년
,mustStatus         number(2)       default 1 not null  -- 필수여부
,day                varchar2(20)    not null    -- 요일
,period             varchar2(40)    not null    -- 교시
,peopleCnt          number(5)                   -- 수강인원
,fk_classNo         number          not null    -- 강의실번호
,fk_professorNo     number          not null    -- 교수번호
,fk_deptSeq         number          not null    -- 학과코드
,constraint PK_tbl_subject_subjectNo primary key(subjectNo)
,constraint FK_tbl_subject_classNo foreign key(fk_classNo) 
                                   references tbl_classroom(classno)
,constraint FK_tbl_subject_professorNo foreign key(fk_professorNo) 
                                   references tbl_professor(professorno)
,constraint FK_tbl_subject_deptSeq foreign key(fk_deptSeq) 
                                   references tbl_dept(deptSeq) 
);

insert into tbl_subject(subjectno, subjectname, credits, grade, day, period, peoplecnt, fk_classno, fk_professorno, fk_deptseq)
values('NE104', '컴퓨터개론', '3', '1', '월,수', '01,02,03,04','30','18101','14', '2')
insert into tbl_subject(subjectno, subjectname, credits, grade, day, period, peoplecnt, fk_classno, fk_professorno, fk_deptseq)
values('NE113', '프로그래밍입문', '3', '1', '월,수', '01,02,03,04','35','18102','13', '2')
insert into tbl_subject(subjectno, subjectname, credits, grade, day, period, peoplecnt, fk_classno, fk_professorno, fk_deptseq)
values('NE106', '수리과학기초', '3', '1', '화,목', '05,06,07,08','32','18205','13', '2')
insert into tbl_subject(subjectno, subjectname, credits, grade, day, period, peoplecnt, fk_classno, fk_professorno, fk_deptseq)
values('NE114', '미적분학', '3', '1', '화,목', '01,02,03,04','40','18105','42', '2')
insert into tbl_subject(subjectno, subjectname, credits, grade, day, period, peoplecnt, fk_classno, fk_professorno, fk_deptseq)
values('NE115', '확률과통계', '3', '1', '화,목', '01,02,03,04','40','18203','14', '2')
insert into tbl_subject(subjectno, subjectname, credits, grade, day, period, peoplecnt, fk_classno, fk_professorno, fk_deptseq)
values('EB103', '경영수학', '3', '1', '화,목', '01,02,03,04','35','18202','11', '1')

insert into tbl_subject(subjectno, subjectname, credits, grade, day, period, peoplecnt, fk_classno, fk_professorno, fk_deptseq)
values('AA101', '결혼과가족', '3', '1', '금', '01,02','50','18204','41', '23')
insert into tbl_subject(subjectno, subjectname, credits, grade, day, period, peoplecnt, fk_classno, fk_professorno, fk_deptseq)
values('AA102', '독서와토론', '2', '1', '금', '07,08,09,10','25','18201','40', '23')
ALTER TABLE TBL_SUBJECT DROP COLUMN SUBJECTNAME;
ALTER TABLE TBL_SUBJECT ADD SUBJECTNAME VARCHAR2(100);
ALTER TABLE TBL_SUBJECT ADD curPeopleCnt number(5) default 0;
COMMIT
update tbl_subject set period = '07080910' where subjectname='확률과통계'
select subjectname
from tbl_subject S
inner join tbl_dept D
on S.fk_deptseq = D.deptseq
where deptname = '경영학과'



select subjectname
from tbl_subject
update tbl_subject set subjectname = '컴퓨터공학개론'
update tbl_subject set curpeoplecnt = 2 where subjectname = '컴퓨터공학개론'

select *
from tbl_subject

select *
from tbl_course
delete from tbl_course where courseno ='73'
commit

update tbl_subject set period='11121314' where subjectname = '프로그래밍입문'
------------------------------------------------------

------------------------------------------------------
-- 학과 공지사항 테이블 생성
create table tbl_dept_notice
(
noticeNo          number          
,contents         varchar2(500)   
,subject          varchar2(500)
,writeDay         DATE            default sysdate
,fk_deptSeq       number          not null
,constraint PK_tbl_dept_notice_noticeNo primary key(noticeNo)
,constraint FK_tbl_dept_notice_deptSeq foreign key(fk_deptSeq) 
                                   references tbl_dept(deptSeq) 
);

-- 학과 공지사항 테이블 시퀀스 생성
create sequence tbl_dept_notice_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
------------------------------------------------------

------------------------------------------------------
-- 과제 테이블 생성
create table tbl_homework
(
workNo              number          not null
, subject           varchar2(500)
, contents          varchar2(500)
, startDate         date            default sysdate
, endDate           date            
, fk_subjectNo      varchar2(20)    not null
,constraint PK_tbl_homework_workNo primary key(workNo)
,constraint FK_tbl_homework_subjectNo foreign key(fk_subjectNo) 
                                   references tbl_subject(subjectNo)
);

create sequence tbl_homework_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

------------- 수강신청 join -------------

select deptname, subjectname, subjectno, name, credits, day, period, peoplecnt, grade, curpeoplecnt
from
(
select p.name, subjectno, subjectname, credits, day, period, peoplecnt, fk_deptseq, grade, curpeoplecnt
from tbl_subject S
inner join tbl_professor P
on S.fk_professorno = p.professorno
) V
inner join tbl_dept D
on V.fk_deptseq = D.deptseq
where deptname = '경영학과' and subjectname = '컴퓨터공학개론' and grade = '1'


select count(*)
from tbl_course C
inner join tbl_subject S
on c.fk_subjectno = S.subjectno
where fk_memberno = '102' and subjectno = 'NE104' and recourse = '0'

update tbl_subject set curpeoplecnt = 1 where subjectname='경영수학'
commit

select *
from tbl_official_leave
--------------------------------------------------
insert into tbl_official_leave(leaveno, startdate, enddate, starttime, endtime, reason, fk_memberno)
values(tbl_official_leave_seq.nextval, '2010-10-10', '2010-10-10', '1', '2', '1', '102')
rollback

commit
select *
from tbl_dept
update tbl_member set grade = '1' where memberno = '102'
select name, filename, orgfilename, filesize, leaveNo, to_char(startDate, 'yyyy-mm-dd') as startDate, to_char(endDate, 'yyyy-mm-dd') as endDate, reason, approve, approveDate, noReason, to_char(regdate, 'yyyy-mm-dd') as regdate
from tbl_official_leave O
inner join tbl_member M
on O.fk_memberno = M.memberno
where fk_memberno = '102';

select name, memberno, grade, deptname, filename, orgfilename, filesize, leaveNo, startDate, endDate, reason, approve, approveDate, noReason, regdate, regyear, regmonth
from
(
select leaveno, name, memberno, grade, deptname, filename, orgfilename, filesize, leaveNo, startDate, regyear, regmonth, endDate, reason, approve, approveDate, noReason, regdate
from
(
    select leaveno, name,memberno, grade, deptname, filename, orgfilename, filesize, leaveNo, to_char(startDate, 'yyyy-mm-dd') as startDate, to_char(regdate, 'yyyy') as regyear,to_char(regdate, 'mm') as regmonth, to_char(endDate, 'yyyy-mm-dd') as endDate, reason, approve, approveDate, noReason, to_char(regdate, 'yyyy-mm-dd') as regdate
    from 
    (
    select name, memberno, grade, deptname
    from tbl_member M
    inner join tbl_dept D
    on M.fk_deptseq = D.deptseq
    )V
    inner join tbl_official_leave O
    on V.memberno = O.fk_memberno
    where fk_memberno = '102'
    order by regdate desc
)Z
where approve in ('승인완료','승인취소') and regyear = '2020' and regmonth in (09,12,11)
)
where rno between 1 and 3

select H.leaveno, name, memberno, grade, deptname, filename, orgfilename, filesize, leaveNo, startDate, endDate, reason, approve, approveDate, noReason
		from
		(
		select W.leaveno, name, memberno, grade, deptname, filename, orgfilename, filesize, leaveNo, startDate, endDate, reason, approve, approveDate, noReason, regdate, regyear, regmonth
		from
		(
		    select rownum as rno, name, O.leaveno, memberno, grade, deptname, filename, orgfilename, filesize, leaveNo, to_char(startDate, 'yyyy-mm-dd') as startDate, to_char(regdate, 'yyyy') as regyear,to_char(regdate, 'mm') as regmonth, to_char(endDate, 'yyyy-mm-dd') as endDate, reason, approve, approveDate, noReason, to_char(regdate, 'yyyy-mm-dd') as regdate
		    from 
		    (
		    select name, memberno, grade, deptname
		    from tbl_member M
		    inner join tbl_dept D
		    on M.fk_deptseq = D.deptseq
		    )V
		    inner join tbl_official_leave O
		    on V.memberno = O.fk_memberno
		    where fk_memberno = '102'
		    order by regdate desc
		)W
		where approve in ('승인완료','승인취소') and regyear = '2020'
		)H
		where rno between 1 and 3

select *
from tbl_official_leave
desc  tbl_official_leave
update tbl_official_leave set approve='승인완료' where leaveno = '5'
commit


select name, memberno, grade, deptname, filename, orgfilename, filesize, leaveNo, startDate, endDate, reason, approve, approveDate, noReason
		from
		(
		select rownum as rno, name, memberno, grade, deptname, filename, orgfilename, filesize, leaveNo, startDate, endDate, reason, approve, approveDate, noReason, regdate, regyear, regmonth
		from
		(
		    select name, memberno, grade, deptname,leaveno, filename, orgfilename, filesize, leaveNo, to_char(startDate, 'yyyy-mm-dd') as startDate, to_char(regdate, 'yyyy') as regyear,to_char(regdate, 'mm') as regmonth, to_char(endDate, 'yyyy-mm-dd') as endDate, reason, approve, approveDate, noReason, to_char(regdate, 'yyyy-mm-dd') as regdate
		    from 
		    (
		    select name, memberno, grade, deptname
		    from tbl_member M
		    inner join tbl_dept D
		    on M.fk_deptseq = D.deptseq
		    )V
		    inner join tbl_official_leave O
		    on V.memberno = O.fk_memberno
		    where fk_memberno = '102'
		    order by regdate desc
		)
		where approve in ('승인완료','승인취소') and regyear = '2020' and regmonth in ('12')
		)
		where rno between 1 and 3
        
        select startDate, endDate, reason, approve, noReason, approveDate, fileName, orgFileName, fileSize, regdate, fk_memberNo
        from tbl_official_leave
        where leaveNo='5'
        
        select *
        from tbl_official_leave
        desc tbl_girl_leave
        delete from tbl_girl_leave
        commit
        
        select girlleaveno, regdate, startDate, startTime, endTime, approve, noreason
        from tbl_girl_leave
        where fk_memberno = '102'
        
            select count(*)
            from tbl_girl_leave
            where fk_memberno = '102' and to_char(startDate,'yyyy')='2020' and to_char(startDate,'mm') = '12'
        
        delete from tbl_girl_leave where firlleaveno =
        
        update tbl_girl_leave set approve = '승인완료'
        commit
        
        
		select name, fk_memberno, reason
		from
		(
		    select name, memberno, grade, deptname, filename, orgfilename, filesize, leaveNo, to_char(startDate, 'yyyy-mm-dd') as startDate, to_char(regdate, 'yyyy') as regyear,to_char(regdate, 'mm') as regmonth, to_char(endDate, 'yyyy-mm-dd') as endDate, reason, approve, approveDate, noReason, to_char(regdate, 'yyyy-mm-dd') as regdate
		    from 
		    (
		    select name, memberno, grade, deptname
		    from tbl_member M
		    inner join tbl_dept D
		    on M.fk_deptseq = D.deptseq
		    )V
		    inner join tbl_official_leave O
		    on V.memberno = O.fk_memberno
		    where fk_memberno = '102'
		    order by regdate desc
		) H
        inner join tbl_girl_leave G 
        on H.memberno = G.fk_memberno
		where approve in ('승인완료','승인취소') and regyear = '2020' and regmonth in ('12')
        
        select *
        from tbl_course
        
        update tbl_member set currentsemester = '2' where memberno='102'
		commit
        
        select courseyear, semester, fk_subjectno, subjectname, name, courseno, classchk
        from
        (
        select courseno, courseyear, semester, fk_subjectno, subjectname, fk_professorno, classchk
        from tbl_course C
        inner join tbl_subject S
        on C.fk_subjectno = S.subjectno 
        where C.fk_memberno = '102' and courseyear='2020' and semester = '2'
        ) V
        inner join tbl_professor p
        on V.fk_professorno = P.professorno
        
        select *
        from tbl_member
        commit
        update tbl_member set jubun='9804142445351' where name='권오윤'
        
        select name, mobile, email, birth, jubun, grade, currentsemester, absencecnt
        from tbl_member
        
        select courseyear, semester, subjectname
        from tbl_course C
        inner join tbl_subject S
        on C.fk_subjectno = S.subjectno
        where courseno='20'
        select * from tbl_course
        
        desc tbl_course
        
        create table tbl_class_check
        ( fk_courseno   number          not null
        , firstqs       varchar2(10)    not null
        , secondqs      varchar2(10)    not null
        , thirdqs       varchar2(10)    not null
        , fourqs        varchar2(10)    not null
        , fiveqs        varchar2(10)    not null
        , sixqs         varchar2(10)    not null
        , sevenqs       varchar2(10)    not null
        , eightqs       varchar2(10)    not null
        , etc           varchar2(300)
        , regdate       date    default sysdate
        , checkKind     varchar2(20)    not null
        ,constraint PK_tbl_class_check_fk_courseno  primary key(fk_courseno)
        ,constraint FK_tbl_class_check_fk_courseno foreign key(fk_courseno) 
                                   references tbl_course(courseno)
        );
        
        insert into tbl_class_check(fk_courseno, firstqs, secondqs, thirdqs, fourqs, fiveqs, sixqs, sevenqs, eightqs, etc, checkKind)
        values()
        
        select *
        from tbl_class_check
          select *
        from tbl_course
        
        desc tbl_course
        delete from tbl_class_check
        ALTER TABLE TBL_course ADD classchk number(2) default 0;
        commit
        
        update tbl_course set classchk = '1' where courseno = ''
        
        select *
        from tbl_member
        update tbl_member set extraaddress='안양동, 래미안 안양 메가트리아' where memberno ='102'
        commit
        select currentSemester, name, memberNo, deptName, birth, grade, mobile, email, address, detailaddress, extraaddress,status
        from 
        (
        select currentSemester, name, memberNo, deptName, birth, grade, mobile, email, address, detailaddress, extraaddress, fk_regseq
		from tbl_member M
		inner join tbl_dept D
		on M.fk_deptseq = D.deptseq
        where memberNo = '102'
        )V
        inner join tbl_school_reg R
        on V.fk_regseq = R.regseq
	