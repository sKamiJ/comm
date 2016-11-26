/*
drop table T_user
*/
create table T_user(
id int constraint PK_user_id primary key identity(1000,1),
login_name varchar(20) not null constraint UQ_user_login_name unique,
password varchar(20) not null,
name varchar(20))

/*
exec sp_help T_user
*/

insert into T_user
	values('kamij','123456','master')

select * from T_user