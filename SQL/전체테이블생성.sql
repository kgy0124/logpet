-- 전체 탭 조회
select * from tab;

--------------------------------------------------------------------

-- 방문자 시퀀스
create sequence s_visit_no nocache;
-- 게시판 리스트 시퀀스
create sequence s_board_list_no nocache;
-- 게시글 시퀀스
create sequence s_board_no nocache;
-- 메시지 시퀀스
create sequence s_msg_no nocache;
-- 대화 시퀀스
create sequence s_chat_no nocache;
-- 첨부파일 시퀀스
create sequence s_board_file_no nocache;
-- 댓글 시퀀스
create sequence s_comment_no nocache;
-- 신고 시퀀스
create sequence s_accuse_no nocache;

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
-- tb_board_code (게시판코드표)
--------------------------------------------------------------------

create table tb_board_code (
    board_code    varchar2(3)    constraint tb_board_code_pk primary key, 
    board_type    varchar2(30)   not null
);

comment on table tb_board_code is '게시판코드표 (자유게시판, 클럽)';
comment on column tb_board_code.board_code is '게시판타입';
comment on column tb_board_code.board_type is '게시판번호';

--------------------------------------------------------------------
-- tb_area_code (지역코드표)
--------------------------------------------------------------------

create table tb_area_code (
    area_code    varchar2(3)     constraint tb_area_code_pk primary key, 
    area_name    varchar2(30)    not null
);

comment on table tb_area_code is '지역코드표';
comment on column tb_area_code.area_code is '지역코드';
comment on column tb_area_code.area_name is '지역명';

--------------------------------------------------------------------
-- tb_blood_code (혈액형코드표)
--------------------------------------------------------------------

create table tb_blood_code (
    blood_code    varchar2(3)     constraint tb_blood_code_pk primary key, 
    blood_type    varchar2(30)    not null 
);

comment on table tb_blood_code is '혈액형코드표';
comment on column tb_blood_code.blood_code is '혈액형코드';
comment on column tb_blood_code.blood_type is '혈액형';

--------------------------------------------------------------------
-- tb_religion_code (종교코드표)
--------------------------------------------------------------------

create table tb_religion_code (
    religion_code    varchar2(3)     constraint tb_religion_code_pk primary key, 
    religion_name    varchar2(30)    not null
);

comment on column tb_religion_code.religion_code is '종교코드';
comment on column tb_religion_code.religion_name is '종교명';

--------------------------------------------------------------------
-- tb_like_code (찜코드표)
--------------------------------------------------------------------

create table tb_like_code (
    like_code    varchar2(3)     constraint tb_like_code_pk primary key, 
    like_type    varchar2(30)    not null 
);

comment on table tb_like_code is '찜코드표 (내가찜한사람, 나를찜한사람, 내가신고한사람)';
comment on column tb_like_code.like_code is '관심코드';
comment on column tb_like_code.like_type is '관심상태';

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
    accuse_cnt    number(6)       default 0, 
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
comment on column tb_user.accuse_cnt is '신고받은횟수';
comment on column tb_user.like_cnt is '받은찜횟수';
comment on column tb_user.image_path is '프로필이미지경로';

--------------------------------------------------------------------
-- tb_user_type (회원 스타일)
--------------------------------------------------------------------

create table tb_user_type (
    id               varchar2(30)    references tb_user(id) on delete cascade primary key, 
    height           varchar2(30)    null, 
    area_code        varchar2(3)     references tb_area_code(area_code) on delete cascade, 
    religion_code    varchar2(3)     references tb_religion_code(religion_code) on delete cascade, 
    blood_code       varchar2(3)     references tb_blood_code(blood_code) on delete cascade, 
    gym_at           char(1)         default 'N', 
    cook_at          char(1)         default 'N',
    fishing_at       char(1)         default 'N',
    game_at          char(1)         default 'N',
    book_at          char(1)         default 'N',
    music_at         char(1)         default 'N',
    travel_at        char(1)         default 'N',
    movie_at         char(1)         default 'N',
    alcohol_at       char(1)         default 'N',
    dance_at         char(1)         default 'N',
    matching_point   number(6)       default 0
);

comment on table tb_user_type is '회원 프로필, 이상형 정보 (취미 등,,)';
comment on column tb_user_type.id is '아이디';
comment on column tb_user_type.height is '키';
comment on column tb_user_type.area_code is '지역코드';
comment on column tb_user_type.religion_code is '종교코드';
comment on column tb_user_type.blood_code is '혈액형코드';
comment on column tb_user_type.gym_at is '운동여부';
comment on column tb_user_type.cook_at is '요리여부';
comment on column tb_user_type.fishing_at is '낚시여부';
comment on column tb_user_type.game_at is '게임여부';
comment on column tb_user_type.book_at is '독서여부';
comment on column tb_user_type.music_at is '음악여부';
comment on column tb_user_type.travel_at is '여행여부';
comment on column tb_user_type.movie_at is '영화여부';
comment on column tb_user_type.alcohol_at is '음주여부';
comment on column tb_user_type.dance_at is '댄스여부';

--------------------------------------------------------------------
-- tb_board_list (게시판 종류)
--------------------------------------------------------------------

create table tb_board_list (
    board_code     varchar2(3)      references tb_board_code(board_code) on delete cascade, 
    board_no       number(6)        constraint tb_board_list_pk primary key, 
    club_name      varchar2(30)     not null, 
    club_maker     varchar2(30)     references tb_user(id) on delete cascade, 
    club_help      varchar2(100)    not null, 
    club_reason    varchar2(100)    not null, 
    club_appro     char(1)          default 'N'
);

comment on table tb_board_list is '게시판 고유번호 및 이름 (자유게시판, 소모임1, 소모임2..)';
comment on column tb_board_list.board_code is '게시판코드';
comment on column tb_board_list.board_no is '게시판번호';
comment on column tb_board_list.club_name is '클럽이름';
comment on column tb_board_list.club_maker is '클럽생성자';
comment on column tb_board_list.club_help is '클럽설명';
comment on column tb_board_list.club_reason is '클럽생성사유';
comment on column tb_board_list.club_appro is '클럽허가여부';

--------------------------------------------------------------------
-- tb_board (게시글)
--------------------------------------------------------------------

create table tb_board (
    board_no            number(6)         references tb_board_list(board_no) on delete cascade, 
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
comment on column tb_board.board_no is '게시판번호';
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
-- tb_profile (회원 프로필이미지)
--------------------------------------------------------------------

create table tb_profile (
    id            varchar2(30)     references tb_user(id) on delete cascade, 
    image_path    varchar2(100)    default '/images/notimage.png' 
);

comment on table tb_profile is '회원 프로필 사진';
comment on column tb_profile.id is '아이디';
comment on column tb_profile.image_path is '이미지경로';

--------------------------------------------------------------------
-- tb_board_member (클럽 멤버)
--------------------------------------------------------------------

create table tb_board_member (
    board_no    number(6)       references tb_board_list(board_no) on delete cascade, 
    id          varchar2(30)    references tb_user(id) on delete cascade
);

comment on table tb_board_member is '클럽 멤버';
comment on column tb_board_member.board_no is '게시판번호';
comment on column tb_board_member.id is '아이디';

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
-- tb_user_chat (대화함)
--------------------------------------------------------------------

create table tb_user_chat (
    id                varchar2(30)      references tb_user(id) on delete cascade,
    chat_no           number(6)         primary key, 
    chat_sender       varchar2(30)      not null, 
    chat_read         char(1)           default 'N', 
    chat_content      varchar2(4000)    not null, 
    chat_send_time    date              default sysdate, 
    del_stat          char(1)           not null
);

comment on table tb_user_chat is '채팅 테이블';
comment on column tb_user_chat.id is '아이디';
comment on column tb_user_chat.chat_no is '대화번호';
comment on column tb_user_chat.chat_sender is '보낸사람';
comment on column tb_user_chat.chat_read is '읽음상태';
comment on column tb_user_chat.chat_content is '채팅내용';
comment on column tb_user_chat.chat_send_time is '받은시간';
comment on column tb_user_chat.del_stat is '삭제상태';

--------------------------------------------------------------------
-- tb_user_accuse (신고정보)
--------------------------------------------------------------------

create table tb_user_accuse (
    accuse_no     number(6)        constraint tb_user_accuse_pk primary key, 
    suspect_id    varchar2(30)     references tb_user(id) on delete cascade, 
    accuse_msg    varchar2(100)    not null, 
    finder_id     varchar2(30)     references tb_user(id) on delete cascade
);

comment on table tb_user_accuse is '신고 사유';
comment on column tb_user_accuse.accuse_no is '신고번호';
comment on column tb_user_accuse.suspect_id is '신고당한아이디';
comment on column tb_user_accuse.accuse_msg is '신고사유';
comment on column tb_user_accuse.finder_id is '신고한아이디';

--------------------------------------------------------------------
-- tb_user_like (좋아요 정보)
--------------------------------------------------------------------

create table tb_user_like (
    id           varchar2(30)    references tb_user(id) on delete cascade, 
    like_code    varchar2(3)     references tb_like_code(like_code) on delete cascade, 
    other_id     varchar2(30)    not null
);

comment on table tb_user_like is '찜/신고 관련 정보 테이블';
comment on column tb_user_like.id is '아이디';
comment on column tb_user_like.like_code is '관심코드';
comment on column tb_user_like.other_id is '상대방아이디';

--------------------------------------------------------------------
-- tb_statistics_visitor (방문자 통계)
--------------------------------------------------------------------

create table tb_statistics_visitor (
    visit_no       number(6)     constraint tb_statistics_visitor_pk primary key, 
    visit_date     date          default sysdate, 
    visitor_cnt    number(10)    not null
);

comment on table tb_statistics_visitor is '방문자 통계 테이블';
comment on column tb_statistics_visitor.visit_no is '방문자통계번호';
comment on column tb_statistics_visitor.visit_date is '해당일자';
comment on column tb_statistics_visitor.visitor_cnt is '방문자수';

--------------------------------------------------------------------

commit;
