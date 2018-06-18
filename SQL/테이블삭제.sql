-- 전체 탭 조회
select * from tab;

--------------------------------------------------------------------
-- 시퀀스 삭제
--------------------------------------------------------------------
-- 방문자 시퀀스
drop sequence s_visit_no;
-- 게시판 리스트 시퀀스
drop sequence s_board_list_no;
-- 게시글 시퀀스
drop sequence s_board_no;
-- 메시지 시퀀스
drop sequence s_msg_no;
-- 대화 시퀀스
drop sequence s_chat_no;
-- 첨부파일 시퀀스
drop sequence s_board_file_no;
-- 댓글 시퀀스
drop sequence s_comment_no;
-- 신고 시퀀스
drop sequence s_accuse_no;

--------------------------------------------------------------------
-- 테이블 삭제 (통째로 날릴때!!)
--------------------------------------------------------------------

-- 게시글 추천 테이블
drop table tb_board_like_cnt purge;
-- 방문자 통계 테이블 삭제
drop table tb_statistics_visitor purge;
-- 좋아요 정보 테이블 삭제
drop table tb_user_like purge;
-- 신고정보 테이블 삭제
drop table tb_user_accuse purge;
-- 대화 테이블 삭제
drop table tb_user_chat purge;
-- 메시지 테이블 삭제
drop table tb_user_msg purge;
-- 클럽 멤버 테이블 삭제
drop table tb_board_member purge;
-- 회원 프로필이미지 테이블 삭제
drop table tb_profile purge;
-- 댓글 테이블 삭제
drop table tb_comment purge;
-- 게시글 첨부파일 테이블 삭제
drop table tb_board_file purge;
-- 게시글 테이블 삭제
drop table tb_board purge;
-- 게시판 종류 테이블 삭제
drop table tb_board_list purge;
-- 회원스타일 테이블 삭제
drop table tb_user_type purge;
-- 회원정보 테이블 삭제
drop table tb_user purge;
-- 코드 테이블 삭제
drop table tb_like_code purge;
drop table tb_religion_code purge;
drop table tb_blood_code purge;
drop table tb_area_code purge;
drop table tb_board_code purge;

--------------------------------------------------------------------
-- 테이블 데이터 삭제 (데이터만 날릴때)
--------------------------------------------------------------------

-- 방문자 통계 테이블 데이터 삭제
delete tb_statistics_visitor;
-- 좋아요 정보 테이블 데이터 삭제
delete tb_user_like;
-- 신고정보 테이블 데이터 삭제
delete tb_user_accuse;
-- 대화 테이블 데이터 삭제
delete tb_user_chat;
-- 메시지 테이블 데이터 삭제
delete tb_user_msg;
-- 클럽 멤버 테이블 데이터 삭제
delete tb_board_member;
-- 회원 프로필이미지 테이블 데이터 삭제
delete tb_profile;
-- 댓글 테이블 데이터 삭제
delete tb_comment;
-- 게시글 첨부파일 테이블 데이터 삭제
delete tb_board_file;
-- 게시글 테이블 데이터 삭제
delete tb_board;
-- 게시판 종류 테이블 데이터 삭제
delete tb_board_list;
-- 회원스타일 테이블 데이터 삭제
delete tb_user_type;
-- 회원정보 테이블 데이터 삭제
delete tb_user;
-- 코드 테이블 데이터 삭제
delete tb_religion_code;
delete tb_blood_code;
delete tb_area_code;
delete tb_board_code;

--------------------------------------------------------------------


commit;
