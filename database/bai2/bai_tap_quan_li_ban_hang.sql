create database if not exists quan_li_ban_hang;
use quan_li_ban_hang;

create table customer(
c_id int primary key auto_increment,
c_name varchar(50) not null,
c_age int not null
);

create table product(
p_id int primary key auto_increment,
p_name varchar(50) not null,
p_price int not null check (p_price > 0)
);

create table `order`(
o_id int primary key auto_increment,
c_id int,
o_date date,
o_total_price int check (o_total_price >= 0),
foreign key(c_id) references customer(c_id)
);

create table order_detail(
o_id int,
p_id int,
primary key(o_id,p_id),
od_qty int not null,
foreign key(o_id) references `order`(o_id),
foreign key(p_id) references product(p_id)
);


