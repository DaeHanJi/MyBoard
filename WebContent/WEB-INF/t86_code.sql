select * from t86_code;
select * from t86_member;
select * from t86_file;
select * from t86_commit;

create table t86_code(
	code_value varchar2(4),
	group_code varchar2(30),
	 code_name varchar2(100),
	  order_no number,
	    use_yn char(1) default 'y'
);
create table t86_member(
	user_id varchar2(100) primary key,
	user_password varchar2(100) not null,
	user_name varchar2(100) not null,
	email_id varchar2(100) not null,
	email_dom_id number not null,
	confirm varchar2(3) default 'n'
);

create sequence s86_board_file_no;

create table t86_file(
	file_no number primary key,
	ori_file_name varchar2(200) not null,
	real_file_name varchar2(200) not null,
	real_path varchar2(300) not null,
	file_size number not null,
	no number not null	
);

create sequence s86_board_comment_no;

create table t86_comment(
	no number not null,
	com_no number primary key,
	com_content varchar2(4000) not null,
	com_writer varchar2(100) not null,
	com_reg_date Date default sysdate
);

insert into t86_commit(no, com_no, com_content, com_writer)
values (1,s86_board_commit_no.nextval,'a','b')

select * from T86_COMMIT
select * from T86_BOARD
select * from t86_file
delete from t86_file
drop table t86_file

insert into t86_file (ori_file_name, real_file_name, real_path, file_size, board_no) 
values('a', 'b', 'c', 1,'d')
insert into t86_code(code_value,group_code,code_name,order_no)
values ('1','email','naver.com',1);

insert into t86_code(code_value,group_code,code_name,order_no)
values ('2','email','daum.com',2);

insert into t86_code(code_value,group_code,code_name,order_no)
values ('3','email','gmail.com',3);

insert into t86_code(code_value,group_code,code_name,order_no)
values ('1','tel','010',1);

insert into t86_code(code_value,group_code,code_name,order_no)
values ('2','tel','011',2);

insert into t86_code(code_value,group_code,code_name,order_no)
values ('3','tel','016',3);


select * from tab;
select * from t86_code;
select * from t86_member;

purge recyclebin;


select * from t86_member
drop table t86_member;

alter table t86_member
rename column email_dom to email_dom_id;


 
select m.user_id userId, m.user_password userPassword, m.user_name userName, m.email_id emailId, j.code_name codeName, m.email_dom_id emailDomId, m.confirm confirm 
from t86_member m,(select code_name, order_no
                   from t86_code
                  where group_code = 'email') j
where m.email_dom_id = order_no;

insert into t86_member (user_id,user_password,user_name,email_id,email_dom_id)
values ('b' , 'a1', 'a1', 'a1', 1)

insert into t86_member ( user_id, user_password, user_name, email_id, email_dom_id)
values ('awerc' , 'wer', 'wer', 'wer', 2)

delete
from t86_member
where user_id = 'a' 

select m.user_id user_id, m.user_password user_password, m.user_name user_name, j.code_name code_name, m.email_id email_id, m.email_dom_id email_dom_id
          from t86_member m,(select code_name, order_no
                               from t86_code
                              where group_code = 'email') j
         where m.email_dom_id = order_no;

         
select m.user_id user_id, m.user_password user_password, m.user_name user_name, j.code_name code_name, m.email_id email_id, m.email_dom_id email_dom_id,m.confirm confirm 
  from t86_member m,(select code_name, order_no
                               from t86_code
                              where group_code = 'email') j
 where m.email_dom_id = order_no
   and m.user_id='b'
   
   select no, com_no comNo, com_content comContent, com_writer comWriter, com_reg_date comRegDate
	  	  from t86_commit
		 where no = 83
		 order by comNo desc
		 
update t86_commit
   set com_content = 'ohno'
 where com_no = 22
 select * from t86_commit