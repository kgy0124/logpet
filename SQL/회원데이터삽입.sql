-- 전체 탭 조회
select * from tab;

--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'admin', 'S', '1111', '관리자', '관리자', '19990101', 'F', 'admin@bitlove.com', sysdate, 'N', '/images/admin.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'sun', 'U', '1111', '김선영', '떠뇽', '19840725', 'F', 'sun@daum.net', sysdate, 'N', '/images/girl.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'mini', 'U', '1111', '김민희', '미니미뇽', '19811231', 'F', 'mini@gmail.com', sysdate, 'N', '/images/girl.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'son', 'U', '1111', '손병찬', '슈퍼강사', '19701212', 'M', 'son@gmail.com', sysdate, 'N', '/images/boy.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'gy', 'U', '1111', '김기영', '기욤기용', '19950405', 'F', 'gy@gmail.com', sysdate, 'N', '/images/girl.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'b', 'U', '1111', '비', '테스트', '19950101', 'M', 'test@test.com', sysdate, 'N', '/images/boy.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'c', 'U', '1111', '씨', '테스트', '19950101', 'M', 'test@test.com', sysdate, 'N', '/images/boy.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'd', 'U', '1111', '디', '테스트', '19950101', 'F', 'test@test.com', sysdate, 'N', '/images/girl.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'e', 'U', '1111', '이', '테스트', '19950101', 'M', 'test@test.com', sysdate, 'N', '/images/boy.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'eve', 'U', '1111', '이브', '이브', '19810601', 'M', 'test@test.com', sysdate, 'N', '/images/boy.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	's', 'S', '1111', '이', '테스트', '19950101', 'M', 'test@test.com', sysdate, 'N', '/images/boy.png'
);

insert into tb_user (
	id, auth, password, name, nick_name, birthday, gender, email, join_date,limit, image_path
) values (
	'good', 'U', '1111', '김굿', '굿걸', '19950101', 'M', 'test@test.com', sysdate, 'N', '/images/girl.png'
);

update tb_user
	set birthday = '19950924'
	where id = 'timmy11';
--------------------------------------------------------------------
select *
	from tb_user
	order by join_date desc;
	
select *
	from tb_user_type;
	where height = null;
	
commit;
