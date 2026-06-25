use quan_li_sinh_vien;

select * from `subject` where credit = (select max(credit) from `subject`);

select s.*, m.mark
from student s
join mark m on s.student_id = m.student_id
where m.mark = (select max(mark) from mark);

select s.*, avg(m.mark)
from student s
join mark m on s.student_id = m.student_id
group by s.student_id
