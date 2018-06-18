

-- 관리자 접속
conn /as sysdba

-- 유저만들기
create user mini identified by mini;

-- 유저에게 관리자 권한주기
grant dba to mini;