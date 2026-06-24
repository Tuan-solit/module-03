use quan_li_sinh_vien;

insert into class() 
values (1,'A1','2026-12-20',1),
		(2,'A2','2026-11-20',1),
		(3,'B1','2026-10-20',1),
		(4,'A3','2026-09-20',0); 
        
insert into student(student_name, adress, phone, `status`, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1),
		('Hoa', 'Hai Phong', '0912113111', 0, 3),
		('Manh', 'Hue', '0912113100', 1, 2),
		('Tao', 'Da Nang', '0912113222', 0, 1);

insert into `subject`
values (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 insert into mark (sub_id, student_id, mark, exam_time)
values (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 select * from class;
 select * from student;
 select * from `subject`;
 select * from mark;
 
 select * from student 
 where student_name like 'H%';
 
 select * from class 
 where month(start_date) = 12;
 
 select * from `subject` 
 where credit between 3 and 5;
 
set SQL_SAFE_UPDATES = 0; 
update student
set class_id = 2 
where student_name = 'Hung';

select s.student_name, sub.sub_name, m.mark
from mark m
inner join student s 
on m.student_id = s.student_id
inner join `subject` sub
on m.sub_id = sub.sub_id;