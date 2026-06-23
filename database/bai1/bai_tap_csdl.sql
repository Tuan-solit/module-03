create database student_management;
use student_management;
create table classes(
id int primary key,
name varchar(50)
);
create table teachers(
id int primary key,
name varchar(50),
age int,
country varchar(50)
);
select * from classes;

insert into classes(id,name) values (1, 'tuan'),
(2, 'tuan2'),
(3, 'tuan3'),
(4, 'tuan4');
select * from teachers;
 