-- 전체 탭 조회
select * from tab;

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
-- tb_board_list (게시판 종류) 입력
--------------------------------------------------------------------
select *
	from tb_board_list;
--------------------------------------------------------------------

insert into tb_board_list (
	board_code, board_no, club_name, club_maker, club_help, club_reason, club_appro
) values (
	'20', 0, '자유게시판', '관리자', '자유게시판입니다.', '자유게시판', 'Y'
);

insert into tb_board_list (
	board_code, board_no, club_name, club_maker, club_help, club_reason, club_appro
) values (
	'21', s_board_list_no.nextval, '집사당', '떠뇽', '집사들의 모임.', '고양이이를 키우는 사람들의 모임을 만들고 싶어서!', 'Y'
);

insert into tb_board_list (
	board_code, board_no, club_name, club_maker, club_help, club_reason, club_appro
) values (
	'21', s_board_list_no.nextval, '등산당', '미니미니', '마운틴고', '건전한 체력단련을 위해', 'Y'
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
-- tb_board_member (클럽 멤버) 입력
--------------------------------------------------------------------
select *
	from tb_board_member;
--------------------------------------------------------------------

insert into tb_board_member (board_no, id)
	values (2, 'sun');

--------------------------------------------------------------------
select *
	from tb_board;
--------------------------------------------------------------------
-- 게시판 조회
select *
	from tb_board b
	inner join tb_user u
	on b.id = u.id
	where b.board_no = 0
	order by no desc;

--------------------------------------------------------------------
select *
	from tb_board_list;
--------------------------------------------------------------------
-- 클럽 생성
insert into tb_board_list (
	board_code, board_no, club_name, club_maker, club_help, club_reason, club_appro
) values (
	'21', s_board_list_no.nextval, '코딩당', '떠뇽', '괴발자들의 모임.', '불꽃코딩을 향해!', 'Y'
);
--------------------------------------------------------------------
-- 클럽 조회 (관리자)
select *
	from tb_board_list
	order by board_no desc;

--------------------------------------------------------------------
-- 클럽 조회 (유저)
select *
	from tb_board_list
	where club_appro = 'Y'
	and board_no NOT IN(0)
	order by board_no;
--------------------------------------------------------------------
-- 게시판 설명 조회
select *
	from tb_board_list bl
	inner join tb_user u
	on bl.club_maker = u.id
	where bl.board_no = 0;

--------------------------------------------------------------------
-- 클럽 가입자 조회
select board_no, id as club_member
	from tb_board_member
	where board_no = 3;
	
delete tb_board_list
	where board_no = 4;
	
insert into tb_board_member(board_no, id)
 values (3, 'sun');

select *
	from tb_board_member;
	
delete tb_board_member;

delete tb_board_member
	where board_no = 3
	and id = 'sun';
	
delete tb_board
	where no = 85;

select *
	from tb_board
	where no = 85;
	
	
commit;
