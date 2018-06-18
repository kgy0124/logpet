-- 전체 탭 조회
select * from tab;
select * from tb_user
	where nick_name ='테스트';
select * from tb_comment;
select * from tb_user_accuse;
select * from tb_area_code;

--------------------------------------------------------------------
-- tb_user_type (회원 스타일) 입력
--------------------------------------------------------------------
select *
	from tb_user_type;
--------------------------------------------------------------------

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'sun', '159', '03', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'mini', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'son', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'gy', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'a', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'b', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'c', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'd', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		'e', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

insert into tb_user_type (
	id, height, area_code, religion_code, blood_code, gym_at, cook_at, fishing_at, game_at, book_at, music_at, travel_at, movie_at, alcohol_at, dance_at
	) values (
		's', '160', '02', '42', '31', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N'
);

--------------------------------------------------------------------
-- 특정 회원 스타일 조회
select *
	from tb_user_type
	where id = 'mini';
	
select *
	from tb_user_type
	where id = 'sun';
	
select *
	from tb_user_type
	where id = 'son';

--------------------------------------------------------------------
-- 이름, 코드테이블정보 함께 조회
select *
	from tb_user_type u
	inner join tb_area_code a
	on u.area_code = a.area_code
	inner join tb_blood_code b
	on u.blood_code = b.blood_code 
	inner join tb_religion_code r
	on u.religion_code = r.religion_code
	inner join tb_user uu
	on u.id = uu.id
where u.id = 'son';

--------------------------------------------------------------------

update tb_user_type
	set height = '165',
		area_code = '15',
		religion_code = '44',
		blood_code = '34',
		gym_at = 'N',
		cook_at = 'Y',
		fishing_at = 'Y',
		game_at = 'N',
		book_at = 'N',
		music_at = 'N',
		travel_at = 'Y',
		movie_at = 'N',
		alcohol_at = 'Y',
		dance_at = 'Y'
	where id = 'sun';

update tb_user_type
	set height = '165',
		area_code = '15',
		religion_code = '44',
		blood_code = '34',
		gym_at = 'Y',
		cook_at = 'N',
		fishing_at = 'Y',
		game_at = 'N',
		book_at = 'Y',
		music_at = 'Y',
		travel_at = 'Y',
		movie_at = 'N',
		alcohol_at = 'N',
		dance_at = 'N'
	where id = 'mini';

--------------------------------------------------------------------
-- 회원스타일 생성
insert into tb_user_type(id, height, area_code, religion_code, blood_code)
	values ('sun', '', '17', '44', '34');
	
insert into tb_user_type(id, height, area_code, religion_code, blood_code)
	values ('admin', '', '17', '44', '34');
	
	
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
-- 신고 카운트 증가
update tb_user
	set accuse_cnt = accuse_cnt + 1
	where id = 'son';
--------------------------------------------------------------------
-- 마이팬에 신고 정보 등록	
insert into tb_user_like (id, like_code, other_id)
	values ('sun', '52', 'son');	
--------------------------------------------------------------------
-- 프로필이미지 변경
update tb_profile
	set image_path = '/images/admin.png'
	where id = 'admin';
	
insert into tb_profile(id, image_path)
	values ('admin', '/images/admin.png');
	
select *
	from tb_profile
	where id = 'admin';
--------------------------------------------------------------------
-- 관심상태 확인
-- 내가 좋아하는 사람
select distinct *
	from tb_user_like l
	inner join tb_user u
	on l.other_id = u.id
	where  l.like_code = '50'
	and l.id = 'sun';
--------------------------------------------------------------------
-- 나를 좋아하는 사람
select distinct *
	from tb_user_like l
	inner join tb_user u
	on l.other_id = u.id
	where  l.like_code = '50'
	and l.other_id = 'sun';
--------------------------------------------------------------------
-- 내가 신고한 사람
select distinct *
	from tb_user_like l
	inner join tb_user u
	on l.other_id = u.id
	where  l.like_code = '52'
	and l.id = 'sun';
--------------------------------------------------------------------
	
select *
	from tb_use
	where id = '100479';

update tb_user
	set password = '1111'
	where id = 'sun';
	
commit;



select *
	from tb_user_type u
	inner join tb_area_code a
	on u.area_code = a.area_code
	inner join tb_blood_code b
	on u.blood_code = b.blood_code 
	inner join tb_religion_code r
	on u.religion_code = r.religion_code
	inner join tb_user uu
	on u.id = uu.id
where u.id = 'mini';

select *
	from tb_user_type u
	inner join tb_area_code a
	on u.area_code = a.area_code
	inner join tb_blood_code b
	on u.blood_code = b.blood_code 
	inner join tb_religion_code r
	on u.religion_code = r.religion_code
	inner join tb_user uu
	on u.id = uu.id
where u.id = 'a';


select * 
		from (select *
			  from tb_user u
    		  inner join tb_user_type ut
	          on u.id = ut.id
   	          where u.auth not in ('S')
		and u.id not in ('a')
      order by u.join_date desc
      ) 
order by like_cnt desc;

select *
	from tb_user_type;
	
update tb_user_type
   set matching_point = matching_point + 1
 where id = 'sun';
 
select *
	from tb_user
	where bye_date is null
	order by join_date desc;