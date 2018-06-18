-- 전체 탭 조회
select * from tab;
select * from tb_user;
select * from tb_comment;
select * from tb_user_accuse;
select * from tb_area_code;

--------------------------------------------------------------------

--------------------------------------------------------------------
-- 좋아요 카운트 증가
update tb_user
	set like_cnt = like_cnt + 1
	where id = 'sun';
--------------------------------------------------------------------
-- 마이팬에 좋아요 정보 등록	
insert into tb_user_like (id, like_code, other_id)
	values ('sun', '50', 'mini');	
insert into tb_user_like (id, like_code, other_id)
	values ('sun', '50', 'gy');	
insert into tb_user_like (id, like_code, other_id)
	values ('sun', '50', 'son');	
--------------------------------------------------------------------
-- 신고 사유 입력
insert into tb_user_accuse (accuse_no, suspect_id, accuse_msg, finder_id)
	values (s_accuse_no.nextval, 'son', '다이어트해서', 'sun');
--------------------------------------------------------------------
-- 회원 신고 카운트 증가
update tb_user
	set accuse_cnt = accuse_cnt + 1
	where id = 'son';
--------------------------------------------------------------------
-- 게시글 신고 카운트 증가
update tb_board
	set board_accuse_cnt = board_accuse_cnt + 1
	where no = 58;
--------------------------------------------------------------------
-- 마이팬에 신고 정보 등록	
insert into tb_user_like (id, like_code, other_id)
	values ('sun', '52', 'son');	
--------------------------------------------------------------------
select *
	from tb_board_list;
--------------------------------------------------------------------
-- 클럽 승인	
update tb_board_list
	set club_appro = 'Y'
	where board_no = 6;
--------------------------------------------------------------------
-- 클럽 승인 거절
update tb_board_list
	set club_appro = 'N'
	where board_no = 6;
--------------------------------------------------------------------
-- 클럽 승인 상태 확인
select *
	from tb_board_list
	where club_appro = 'Y'
	and board_no = 6;
--------------------------------------------------------------------
-- 유저 신고 상태 확인
select *
	from tb_user
	order by accuse_cnt desc;
--------------------------------------------------------------------
-- 유저 블락 해제
update tb_user
	set limit = 'Y'
	where id = 'c';
--------------------------------------------------------------------
-- 유저 블락
update tb_user
	set limit = 'N'
	where id = 'c';
--------------------------------------------------------------------
-- 유저 블락 확인
select *
	from tb_user
	where limit = 'Y'
	and id = 'c';
--------------------------------------------------------------------
	
	
	
	
	
	
	
commit;


