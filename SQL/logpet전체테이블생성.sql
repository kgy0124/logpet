-- 전체 탭 조회
select * from tab;

--------------------------------------------------------------------

-- 게시글 시퀀스
create sequence s_board_no nocache;
-- 메시지 시퀀스
create sequence s_msg_no nocache;
-- 첨부파일 시퀀스
create sequence s_board_file_no nocache;
-- 댓글 시퀀스
create sequence s_comment_no nocache;
-- 펫종류 시퀀스
create sequence s_select_code nocache;
-- 펫성별 시퀀스
create sequence s_gender_code nocache;

--------------------------------------------------------------------
--테이블 생성 시 테이블명_  사이에 이렇게 공백 들어갈 시 오류
--------------------------------------------------------------------

-- fk 항목에는 on delete cascade 옵션 붙이기

-- 컬럼 데이터 타입 변경
-- alter table tb_board_code modify(board_type varchar2(30));
-- alter table tb_user_chat modify(chat_send_time date default sysdate);

-- alter table tb_user_type modify(height varchar2(30) null);
-- alter table tb_user_type modify(id varchar2(30) references tb_user(id) on delete cascade primary key);
-- alter table tb_board_list modify(club_maker varchar2(30) references tb_user(id) on delete cascade);
-- alter table tb_board_like_cnt modify(no number(6) references tb_board(no) on delete cascade);

-- 컬럼 추가
-- alter table tb_user add(image_path varchar2(100));
-- alter table tb_user_msg add(send_del_yn char(1) default 'N');
-- alter table tb_user_msg add(recv_del_yn char(1) default 'N');
-- alter table tb_user_type add(matching_point number(6) default 0);

--------------------------------------------------------------------
-- tb_pet_select (펫종류코드표)
--------------------------------------------------------------------

create table tb_pet_select (
    select_code    varchar2(3)    constraint tb_pet_select_code_pk primary key, 
    select_name    varchar2(20)   not null
);

comment on table tb_pet_select is '펫종류코드표';
comment on column tb_pet_select.select_code is '펫종류코드';
comment on column tb_pet_select.select_name is '펫종류';

--------------------------------------------------------------------
-- tb_pet_gender (펫성별코드표)
--------------------------------------------------------------------

create table tb_pet_gender (
    gender_code    varchar2(3)     constraint tb_pet_gender_code_pk primary key, 
    gender_type    varchar2(20)    not null
);

comment on table tb_pet_gender is '펫성별코드표';
comment on column tb_pet_gender.gender_code is '펫성별코드';
comment on column tb_pet_gender.gender_type is '펫성별';

--------------------------------------------------------------------
-- tb_user 회원정보
--------------------------------------------------------------------

create table tb_user (
    id            varchar2(30)    constraint tb_user_pk primary key, 
    auth          char(1)         default 'U', 
    password      varchar2(30)    null, 
    name          varchar2(30)    not null, 
    nick_name     varchar2(30)    not null, 
    birthday      varchar2(8)     not null, 
    gender        char(1)         not null, 
    email         varchar2(50)    not null, 
    join_date     date            default sysdate, 
    bye_date      date            null, 
    limit         char(1)         default 'N', 
    like_cnt      number(6)       default 0,
    image_path    varchar2(100)   not null
);

comment on table tb_user is '회원정보';
comment on column tb_user.id is '아이디';
comment on column tb_user.auth is '권한';
comment on column tb_user.password is '비밀번호';
comment on column tb_user.name is '이름';
comment on column tb_user.nick_name is '별명';
comment on column tb_user.birthday is '생년월일';
comment on column tb_user.gender is '성별';
comment on column tb_user.email is '이메일';
comment on column tb_user.join_date is '가입일';
comment on column tb_user.bye_date is '탈퇴일자';
comment on column tb_user.limit is '영구제한';
comment on column tb_user.image_path is '프로필이미지경로';

--------------------------------------------------------------------
-- tb_user_ pet 회원 펫 정보
--------------------------------------------------------------------

CREATE TABLE tb_user_pet (
    id              varchar2(30)     references tb_user(id) on delete cascade,
    pet_no          number(6)        constraint tb_user_pet_no_pk primary key, 
    pet_name        varchar2(10)     not null, 
    pet_birth       varchar2(8)      not null, 
    pet_kg          varchar2(10)     not null, 
    select_code     varchar2(3)      references tb_pet_select(select_code) on delete cascade, 
    gender_code     varchar2(3)      references tb_pet_gender(gender_code) on delete cascade, 
    pet_kg_plan     varchar2(10)     null, 
    pet_img_path    varchar2(100)    not null
);

comment on table tb_user_pet is '회원펫정보';
comment on column tb_user.id is '아이디';
comment on column tb_user_pet.pet_no is '펫번호';
comment on column tb_user_pet.pet_name is '펫이름';
comment on column tb_user_pet.pet_birth is '펫생일';
comment on column tb_user_pet.pet_kg is '펫몸무게';
comment on column tb_user_pet.select_code is '펫종류코드';
comment on column tb_user_pet.gender_code is '펫성별코드';
comment on column tb_user_pet.pet_kg_plan is '펫목표체중';
comment on column tb_user_pet.pet_img_path is '펫사진경로';

--------------------------------------------------------------------
-- tb_board (게시글)
--------------------------------------------------------------------

create table tb_board (
    board_type          char(1)           not null,
    no                  number(6)         constraint tb_board_no_pk primary key, 
    id                  varchar2(30)      references tb_user(id) on delete cascade, 
    title               varchar2(100)     not null, 
    content             varchar2(4000)    not null, 
    reg_date            date              default sysdate, 
    view_cnt            number(6)         default 0, 
    board_accuse_cnt    number(6)         default 0, 
    board_cnt           number(6)         default 0
);

comment on table tb_board is '게시판에 등록되는 글에 대한 정보';
comment on column tb_board.board_type is '게시판타입(자유,익명,펫)';
comment on column tb_board.no is '글번호';
comment on column tb_board.id is '아이디';
comment on column tb_board.title is '제목';
comment on column tb_board.content is '내용';
comment on column tb_board.reg_date is '등록일';
comment on column tb_board.view_cnt is '조회수';
comment on column tb_board.board_accuse_cnt is '게시글신고횟수';
comment on column tb_board.board_cnt is '글추천수';

--------------------------------------------------------------------
-- tb_board_like_cnt (게시글 좋아요한 id와 글번호)
--------------------------------------------------------------------
create table tb_board_like_cnt (
    id    varchar2(30)    references tb_user (id)  on delete cascade, 
    no    number(6)       references tb_board (no) on delete cascade, 
    constraint tb_board_like_cnt_pk primary key (id, no)
);

comment on table tb_board_like_cnt is '글 추천한 회원정보와 추천된 글번호';
comment on column tb_board_like_cnt.id is '아이디';
comment on column tb_board_like_cnt.no is '글번호';
--------------------------------------------------------------------
-- tb_board_accuse_cnt (게시글 신고한 id와 글번호)
--------------------------------------------------------------------
create table tb_board_accuse_cnt (
    id    varchar2(30)    references tb_user (id)  on delete cascade, 
    no    number(6)       references tb_board (no) on delete cascade, 
    constraint tb_board_accuse_cnt_pk primary key (id, no)
);

comment on table tb_board_like_cnt is '글 추천한 회원정보와 추천된 글번호';
comment on column tb_board_like_cnt.id is '아이디';
comment on column tb_board_like_cnt.no is '글번호';

--------------------------------------------------------------------
-- tb_board_file (게시판 첨부파일)
--------------------------------------------------------------------

create table tb_board_file (
    file_no        number(6)        constraint tb_board_file primary key, 
    no             number(6)        references tb_board(no) on delete cascade, 
    file_path      varchar2(100)    not null, 
    ori_name       varchar2(100)    not null, 
    system_name    varchar2(100)    not null, 
    file_size      number(6)        not null 
);

comment on table tb_board_file is '게시판 첨부파일 및 프로필 이미지 정보';
comment on column tb_board_file.file_no is '파일번호';
comment on column tb_board_file.no is '글번호';
comment on column tb_board_file.file_path is '파일경로';
comment on column tb_board_file.ori_name is '원본이름';
comment on column tb_board_file.system_name is '시스템이름';
comment on column tb_board_file.file_size is '파일크기';

--------------------------------------------------------------------
-- tb_comment (댓글)
--------------------------------------------------------------------

create table tb_comment (
    no            number(6)         references tb_board(no) on delete cascade, 
    id            varchar2(30)      references tb_user(id) on delete cascade, 
    content       varchar2(1000)    not null, 
    comment_no    number(6)         constraint tb_comment_pk primary key, 
    reg_date      date              default sysdate
);

comment on table tb_comment is '댓글';
comment on column tb_comment.no is '글번호';
comment on column tb_comment.id is '아이디';
comment on column tb_comment.content is '댓글내용';
comment on column tb_comment.comment_no is '댓글번호';
comment on column tb_comment.reg_date is '댓글등록일';

--------------------------------------------------------------------
-- tb_user_msg 테이블 생성 (메시지함)
--------------------------------------------------------------------

create table tb_user_msg (
    id               varchar2(30)      references tb_user(id) on delete cascade, 
    msg_no           number(6)         constraint tb_user_msg_pk primary key, 
    msg_sender       varchar2(30)      not null, 
    msg_read         char(1)           default 'N', 
    msg_content      varchar2(4000)    not null, 
    send_del_yn      char(1)           default 'N',
    recv_del_yn      char(1)           default 'N',
    msg_send_time    date              default sysdate
);

comment on table tb_user_msg is '메시지 테이블';
comment on column tb_user_msg.id is '아이디';
comment on column tb_user_msg.msg_no is '메시지번호';
comment on column tb_user_msg.msg_sender is '보낸사람';
comment on column tb_user_msg.msg_read is '읽음상태';
comment on column tb_user_msg.msg_content is '쪽지내용';
comment on column tb_user_msg.msg_send_time is '받은시간';


--------------------------------------------------------------------

commit;
