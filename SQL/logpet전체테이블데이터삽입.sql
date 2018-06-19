-- 전체 탭 조회
select * from tab;
select *
	from tb_stat_visitor
	order by vdate desc;
--------------------------------------------------------------------
--  tb_pet_select (펫종류코드표)
--------------------------------------------------------------------
select *
	from tb_pet_select;
--------------------------------------------------------------------

insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '고양이');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '토끼');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '강아지');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '고슴도치');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '페럿');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '기니피그');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '햄스터');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '이구아나');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '도마뱀');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '뱀');
insert into tb_pet_select (select_code, select_type)
	values (s_select_code.nextval, '거북');


--------------------------------------------------------------------
-- tb_pet_gender (펫성별코드표)
--------------------------------------------------------------------
select *
	from tb_pet_gender;
--------------------------------------------------------------------

insert into tb_area_code (gender_code, gender_type)
	values (s_gender_code.nextval, '수컷');
insert into tb_area_code (gender_code, gender_type)
	values (s_gender_code.nextval, '수컷(중성화)');
insert into tb_area_code (gender_code, gender_type)
	values (s_gender_code.nextval, '암컷');
insert into tb_area_code (gender_code, gender_type)
	values (s_gender_code.nextval, '암컷'(중성화));
insert into tb_area_code (gender_code, gender_type)
	values (s_gender_code.nextval, '모름');

--------------------------------------------------------------------
-- tb_user 회원정보 입력
--------------------------------------------------------------------
select *
	from tb_user;
--------------------------------------------------------------------

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, accuse_cnt, like_cnt, image_path
) values (
	'admin', 'S', '1111', '관리자', '관리자', '19990101', 'F', 'admin@bitlove.com', sysdate, 'N', 0, 0, '/images/admin.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, accuse_cnt, like_cnt, image_path
) values (
	'gy', 'U', '1111', '김기영', '기욤기용', '19950405', 'F', 'gy@gmail.com', sysdate, 'N', 0, 0, '/images/girl.png'
);
--------------------------------------------------------------------
-- tb_user_ pet 회원펫정보 입력
--------------------------------------------------------------------
select *
	from tb_user_ pet;
--------------------------------------------------------------------
 
insert into tb_user_ pet (
	id, pet_no, pet_name, pet_birth, pet_kg, select_code, gender_code, pet_kg_plan, pet_img_path
) values (
	'gy', '1', '블랑', '20160101', '5', 's_select_code.nextval', 's_gender_code.nextval', '4', '/images/admin.png'
);


--------------------------------------------------------------------
-- tb_board (게시글) 입력
--------------------------------------------------------------------
select *
	from tb_board;
--------------------------------------------------------------------

insert into tb_board (
	board_type, no, id, title, content, reg_date
) values (
	1, s_board_no.nextval, 'sun', '제목', '내용', sysdate
);

--------------------------------------------------------------------
-- tb_board_file (게시판 첨부파일) 입력
--------------------------------------------------------------------
select *
	from tb_board_file;
--------------------------------------------------------------------

insert into tb_board_file (
	file_no, no, file_path, ori_name, system_name, file_size
) values (
	s_board_file_no.nextval, 1, 'c:/java-lec/upload', 'oriname1', 'sysname1', 1024
);

--------------------------------------------------------------------
-- tb_comment (댓글) 입력
--------------------------------------------------------------------
select *
	from tb_comment;
--------------------------------------------------------------------

insert into tb_comment (no, id, content, comment_no)
	values (1, 'sun', '댓글내용', s_comment_no.nextval);




--------------------------------------------------------------------
-- tb_user_msg 테이블 생성 (메시지함) 입력
--------------------------------------------------------------------
select *
	from tb_user_msg;
--------------------------------------------------------------------

insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('sun', s_msg_no.nextval, 'admin', '쪽지내용');



--------------------------------------------------------------------
-- tb_board_like_cnt (게시글 추천 테이블)
--------------------------------------------------------------------
insert into tb_board_like_cnt (id, no) values ('s', 82);
--------------------------------------------------------------------

--------------------------------------------------------------------
-- tb_board_accuse_cnt (게시글 tlsrh 테이블)
--------------------------------------------------------------------
insert into tb_board_accuse_cnt (id, no) values ('s', 82);
--------------------------------------------------------------------

select *
	from tb_user_type
	where gym_at = 'Y';

select t.*, count(*) over () as num_rows
  from (select *
	from tb_user_type
	where gym_at = 'Y' and id = 'sun') t;

commit;
