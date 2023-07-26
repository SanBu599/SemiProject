

create table maeil_member(
	employee_id int auto_increment primary key,
	employee_name varchar(30) not null,
    employee_password varchar(50) not null,
    employee_email varchar(50),
    department_id int,
    department_name varchar(50),
    auth int not null,
    edate date not null,
    erank varchar(30)
);

select*
from maeil_member;

insert into maeil_member(employee_id,employee_name, employee_password, employee_email, department_id, department_name, auth, edate, erank)
values('2023001', '홍길동11', '1111', 'aaa@hong11.com', 111, 'IT 1팀', 3, '2011-11-11', '사원11');

insert into maeil_member(employee_id,employee_name, employee_password, employee_email, department_id, department_name, auth, edate, erank)
values('2023002', '홍길동22', '1111', 'abc@hong11.com', 111, 'IT 1팀', 3, '2022-11-11', '차장11');

insert into maeil_member(employee_id,employee_name, employee_password, employee_email, department_id, department_name, auth, edate, erank)
values('2023003', '홍길동33', '1111', 'cba@hong11.com', 222, 'IT 2팀', 1, '2021-11-11', '부장11');

insert into maeil_member(employee_id,employee_name, employee_password, employee_email, department_id, department_name, auth, edate, erank)
values('2023004', '홍길동44', '1111', 'bbb@hong11.com', 222, 'IT 2팀', 3, '2011-12-12', '과장11');

insert into maeil_member(employee_id,employee_name, employee_password, employee_email, department_id, department_name, auth, edate, erank)
values('2023005', '홍길동55', '1111', 'ccc@hong11.com', 333, '인사 1팀', 3, '2002-01-11', '대리11');

delete from maeil_member
where employee_id=5;



