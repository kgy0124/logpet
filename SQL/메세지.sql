-- 전체 탭 조회
select * from tab;

select * from tb_user;

select * from tb_profile;

select * from tb_comment;

--------------------------------------------------------------------

--------------------------------------------------------------------
select *
	from tb_user_msg;
--------------------------------------------------------------------

insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('sun', s_msg_no.nextval, 'admin', '관리자 쪽지');
	
insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('sun', s_msg_no.nextval, 'gy', '기ㅇ용용용용');
	
insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('sun', s_msg_no.nextval, 'mini', '미니미니니미니니미니');
	
insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('sun', s_msg_no.nextval, 'son', '다이어트 중입니다.');

--------------------------------------------------------------------
-- 아이디 조회
select *
	from tb_user
where id = 'sun';
--------------------------------------------------------------------
-- 미수신 메시지 갯수 조회
select count(*)
	from tb_user_msg
where id = 'sun'
	and msg_read = 'N';
--------------------------------------------------------------------
-- 받은쪽지 조회
select *
		from tb_user_msg m
		inner join tb_user u
		on m.msg_sender = u.id
	where m.id = 'timmy11'
	and send_del_yn = 'N'
	order by msg_send_time desc;
--------------------------------------------------------------------
-- 보낸쪽지 조회
select *
		from tb_user_msg m
		inner join tb_user u
		on m.id = u.id
	where m.msg_sender = 'timmy11'
	and recv_del_yn = 'N'
	order by msg_send_time desc;
--------------------------------------------------------------------
-- 쪽지 디테일
select *
		from tb_user_msg m
		inner join tb_user u
		on m.msg_sender = u.id
	where m.msg_no = 15;	
--------------------------------------------------------------------
-- 쪽지 읽음표시
update tb_user_msg
	set msg_read = 'Y'
	where msg_no = '19';
--------------------------------------------------------------------
-- 받은쪽지 삭제
update tb_user_msg
	set send_del_yn = 'Y'
	where msg_no = '48';
--------------------------------------------------------------------
-- 보낸쪽지 삭제
update tb_user_msg
	set recv_del_yn = 'Y'
	where msg_no = '48';
--------------------------------------------------------------------
-- 쪽지 삭제 상태 확인
select *
 from tb_user_msg
	where recv_del_yn = 'Y'
		and send_del_yn = 'Y'
		and msg_no = 48;
--------------------------------------------------------------------
-- 쪽지 삭제
delete tb_user_msg
	where recv_del_yn = 'Y'
		and send_del_yn = 'Y'
		and msg_no = 48;
--------------------------------------------------------------------
-- 쪽지 전송
insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('gy', s_msg_no.nextval, 'sun', '쪽지11');
	
insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('mini', s_msg_no.nextval, 'sun', '쪽지33');

insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('son', s_msg_no.nextval, 'sun', '쪽지22');
	
insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('sun', s_msg_no.nextval, 'gy', '쪽지11');
	
insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('sun', s_msg_no.nextval, 'mini', '쪽지33');

insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('gy', s_msg_no.nextval, 'son', '쪽지22');
	
insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('aaaaa', s_msg_no.nextval, 'mini', '쪽지33');

insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('aaaaa', s_msg_no.nextval, 'son', '쪽지22');
	
insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('admin', s_msg_no.nextval, 'mini', '쪽지33');

insert into tb_user_msg (id, msg_no, msg_sender, msg_content)
	values ('sun', s_msg_no.nextval, 'son', '쪽지22');
	
commit;
