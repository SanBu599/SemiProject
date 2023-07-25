
create table maeil_member(
	employee_id int primary key auto_increment, 
	employee_name varchar(30) not null,
	employee_password varchar(20) not null,
	employee_email varchar(50),
	department_id int(8),
	department_name varchar(30),
	auth int(4) not null,
	edate timestamp not null,
	erank varchar(8)
)

alter table maeil_member
add
newfilename varchar(100)

select * from maeil_member

create table maeil_announcement(
	seq int primary key auto_increment,
	employee_id int not null,
	title varchar(200) not null,
	content varchar(4000) not null,
	writing_period timestamp,
	auth int not null
)