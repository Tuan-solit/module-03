use quan_li_ban_hang;

insert into customer( c_name, c_age)
values
( 'Minh Quan', 10),
( 'Ngoc Oanh', 20),
( 'Hong Ha', 50);

insert into product( p_name, p_price)
values
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

insert into `order`( c_id, o_date, o_total_price)
values
( 1, '2006-03-21', null),
( 2, '2006-03-23', null),
( 1, '2006-03-16', null);

insert into order_detail(o_id, p_id, od_qty)
values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select o_id, o_date, o_total_price from `order`;

select c.c_name, p.p_name, od.od_qty 
from customer c
join `order` o
on c.c_id = o.c_id
join order_detail od
on o.o_id = od.o_id
join product p 
on od.p_id = p.p_id;

select c.c_name 
from customer c
left join `order` o
on c.c_id = o.c_id
where o.o_id is null;

select o.o_id, o.o_date, sum(od.od_qty * p.p_price) as total_price
from `order` o
join order_detail od
on o.o_id = od.o_id
join product p
on od.p_id = p.p_id
group by o.o_id, o.o_date;