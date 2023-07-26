use mydb;


delete c
from maeil_department_calendar as c
INNER JOIN maeil_member as m on (m.employee_id = c.employee_id)
where seq ='90';
    
SELECT * FROM maeil_department_calendar;
  
    
select m.department_id, c.seq, c.employee_id, c.title, c.content, c.rdate, c.wdate, c.share, m.auth
from maeil_member m 
join (select row_number()over(partition by substr(rdate, 1, 8)
		order by rdate asc) as rnum, seq, employee_id, title, content, rdate, wdate, share		  
	  	from maeil_department_calendar
		where substr(rdate, 1, 6)='202307') c
	on m.employee_id = c.employee_id
where (m.department_id='111' and share != 2) and rnum between 1 and 3;
	
        
    
select m.department_id, c.seq, c.employee_id, c.title, c.content, c.rdate, c.wdate, c.share, m.auth
from maeil_member m
join maeil_department_calendar c
	on m.employee_id = c.employee_id	
where (m.department_id = '111' and share != 2) and substr(rdate,1,8) like 20230704
order by rdate asc;
    
    
    
    
    