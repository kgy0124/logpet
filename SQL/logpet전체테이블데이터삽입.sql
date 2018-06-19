-- 전체 탭 조회
select * from tab;
select *
	from tb_stat_visitor
	order by vdate desc;
--------------------------------------------------------------------
-- tb_board_code (게시판코드표)
--------------------------------------------------------------------
select *
	from tb_board_code;
--------------------------------------------------------------------

insert into tb_board_code (board_code, board_type)
	values ('20', '자유게시판');
insert into tb_board_code (board_code, board_type)
	values ('21', '클럽');

--------------------------------------------------------------------
-- tb_area_code (지역코드표)
--------------------------------------------------------------------
select *
	from tb_area_code;
--------------------------------------------------------------------

insert into tb_area_code (area_code, area_name)
	values ('01', '서울');
insert into tb_area_code (area_code, area_name)
	values ('02', '인천');
insert into tb_area_code (area_code, area_name)
	values ('03', '경기');
insert into tb_area_code (area_code, area_name)
	values ('04', '강원');
insert into tb_area_code (area_code, area_name)
	values ('05', '충북');
insert into tb_area_code (area_code, area_name)
	values ('06', '충남');
insert into tb_area_code (area_code, area_name)
	values ('07', '대전');
insert into tb_area_code (area_code, area_name)
	values ('08', '경북');
insert into tb_area_code (area_code, area_name)
	values ('09', '대구');
insert into tb_area_code (area_code, area_name)
	values ('10', '울산');
insert into tb_area_code (area_code, area_name)
	values ('11', '경남');
insert into tb_area_code (area_code, area_name)
	values ('12', '부산');
insert into tb_area_code (area_code, area_name)
	values ('13', '전북');
insert into tb_area_code (area_code, area_name)
	values ('14', '광주');
insert into tb_area_code (area_code, area_name)
	values ('15', '전남');
insert into tb_area_code (area_code, area_name)
	values ('16', '제주');
insert into tb_area_code (area_code, area_name)
	values ('17', '기타');

--------------------------------------------------------------------
-- tb_blood_code (혈액형코드표)
--------------------------------------------------------------------
select *
	from tb_blood_code;
--------------------------------------------------------------------

insert into tb_blood_code (blood_code, blood_type)
	values ('30', 'A');
insert into tb_blood_code (blood_code, blood_type)
	values ('31', 'B');
insert into tb_blood_code (blood_code, blood_type)
	values ('32', 'AB');
insert into tb_blood_code (blood_code, blood_type)
	values ('33', 'O');
insert into tb_blood_code (blood_code, blood_type)
	values ('34', '기타');

--------------------------------------------------------------------
-- tb_religion_code (종교코드표)
--------------------------------------------------------------------
select *
	from tb_religion_code;
--------------------------------------------------------------------

insert into tb_religion_code (religion_code, religion_name)
values ('40', '기독교');
insert into tb_religion_code (religion_code, religion_name)
values ('41', '천주교');
insert into tb_religion_code (religion_code, religion_name)
values ('42', '불교');
insert into tb_religion_code (religion_code, religion_name)
values ('43', '무교');
insert into tb_religion_code (religion_code, religion_name)
values ('44', '기타');

--------------------------------------------------------------------
-- tb_like_code (찜코드표)
--------------------------------------------------------------------
select *
	from tb_like_code;
--------------------------------------------------------------------

insert into tb_like_code (like_code, like_type)
	values ('50', '내가찜한사람');
insert into tb_like_code (like_code, like_type)
	values ('51', '나를찜한사람');
insert into tb_like_code (like_code, like_type)
	values ('52', '내가신고한사람');

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
	'sun', 'U', '1111', '김선영', '떠뇽', '19840725', 'F', 'sun@daum.net', sysdate, 'N', 0, 0, '/images/girl.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, accuse_cnt, like_cnt, image_path
) values (
	'mini', 'U', '1111', '김민희', '미니미뇽', '19811231', 'F', 'mini@gmail.com', sysdate, 'N', 0, 0, '/images/girl.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, accuse_cnt, like_cnt, image_path
) values (
	'son', 'U', '1111', '손병찬', '슈퍼강사', '19701212', 'M', 'son@gmail.com', sysdate, 'N', 0, 0, '/images/boy.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, accuse_cnt, like_cnt, image_path
) values (
	'gy', 'U', '1111', '김기영', '기욤기용', '19950405', 'F', 'gy@gmail.com', sysdate, 'N', 0, 0, '/images/girl.png'
);

--------------------------------------------------------------------
-- tb_user_type (회원 스타일) 입력
--------------------------------------------------------------------
select *
	from tb_user_type;
--------------------------------------------------------------------

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'sun', '159', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'mini', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'admin', '168', '03', '42', '31', 'N', 'Y', 'N', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'Y'
);

--------------------------------------------------------------------
-- tb_board_list (게시판 종류) 입력
--------------------------------------------------------------------
select *
	from tb_board_list;
--------------------------------------------------------------------

insert into tb_board_list (
	board_code, board_no, board_name, board_maker, board_help, board_reason, board_appro
) values (
	'20', 0, '자유게시판', 'admin', '자유게시판입니다.', '자유게시판', 'Y'
);

insert into tb_board_list (
	board_code, board_no, board_name, board_maker, board_help, board_reason, board_appro
) values (
	'21', s_board_list_no.nextval, '집사당', 'sun', '집사들의 모임.', '고양이이를 키우는 사람들의 모임을 만들고 싶어서!', 'Y'
);

insert into tb_board_list (
	board_code, board_no, board_name, board_maker, board_help, board_reason, board_appro
) values (
	'21', s_board_list_no.nextval, '등산당', 'mini', '마운틴고', '건전한 체력단련을 위해', 'Y'
);

--------------------------------------------------------------------
-- tb_board (게시글) 입력
--------------------------------------------------------------------
select *
	from tb_board;
--------------------------------------------------------------------

insert into tb_board (
	board_no, no, id, title, content, reg_date
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
-- tb_profile (회원 프로필이미지) 입력
--------------------------------------------------------------------
select *
	from tb_profile;
--------------------------------------------------------------------

insert into tb_profile (id)
	values ('sun');

--------------------------------------------------------------------
-- tb_board_member (클럽 멤버) 입력
--------------------------------------------------------------------
select *
	from tb_board_member;
--------------------------------------------------------------------

insert into tb_board_member (board_no, id)
	values (2, 'sun');

--------------------------------------------------------------------
-- tb_user_msg 테이블 생성 (메시지함) 입력
--------------------------------------------------------------------
select *
	from tb_user_msg;
--------------------------------------------------------------------

insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('sun', s_msg_no.nextval, 'admin', '쪽지내용');

--------------------------------------------------------------------
-- tb_user_chat (대화함) 입력
--------------------------------------------------------------------
select *
	from tb_user_chat;
--------------------------------------------------------------------

insert into tb_user_chat (id, chat_no, chat_sender, chat_content, del_stat) 
	values ('sun', s_chat_no.nextval, 'admin', '대화내용', 'N');
	
--------------------------------------------------------------------
-- tb_user_accuse (신고정보) 입력
--------------------------------------------------------------------
select *
	from tb_user_accuse;
--------------------------------------------------------------------

insert into tb_user_accuse (accuse_no, suspect_id, accuse_msg, finder_id)
	values (s_accuse_no.nextval, 'admin', '권한남용', 'sun');

--------------------------------------------------------------------
-- tb_user_like (좋아요 정보) 입력
--------------------------------------------------------------------
select *
	from tb_user_like;
--------------------------------------------------------------------

insert into tb_user_like (id, like_code, other_id) 
	values ('sun', '50', 'admin');
insert into tb_user_like (id, like_code, other_id)
	values ('sun', '51', 'admin');
insert into tb_user_like (id, like_code, other_id)
	values ('sun', '52', 'admin');
	
--------------------------------------------------------------------
-- tb_statistics_visitor (방문자 통계) 입력
--------------------------------------------------------------------
select *
	from tb_statistics_visitor;
select *
	from tb_stat_visitor
	order by vdate desc;
--------------------------------------------------------------------

insert into tb_statistics_visitor (visit_no, visitor_cnt)
	values (s_visit_no.nextval, 1);

--------------------------------------------------------------------
-- tb_board_likecnt (게시글 추천 테이블)
--------------------------------------------------------------------
insert into tb_board_like_cnt (id, no) values ('s', 82);
insert into tb_board_like_cnt (id, no) values ('s', 79);
insert into tb_board_like_cnt (id, no) values ('sun', 82);
--------------------------------------------------------------------

select *
	from tb_user_type
	where gym_at = 'Y';

select t.*, count(*) over () as num_rows
  from (select *
	from tb_user_type
	where gym_at = 'Y' and id = 'sun') t;

commit;
