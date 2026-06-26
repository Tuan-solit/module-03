create database demo;
use demo;

create table products(
id int primary key auto_increment,
product_code varchar(20) not null,
product_name varchar(100) not null,
product_price decimal(10,2)not null,
product_amount int not null,
product_description text,
product_status varchar(50)
);

insert into products (product_code, product_name, product_price, product_amount, product_description, product_status) values 
('p001', 'iphone 15 pro', 28990000.00, 15, 'điện thoại apple chính hãng, bộ nhớ 128gb', 'còn hàng'),
('p002', 'samsung galaxy s24', 21990000.00, 8, 'điện thoại samsung flagship, màu xám tinh vân', 'còn hàng'),
('p003', 'macbook air m3', 27490000.00, 5, 'máy tính xách tay apple m3, ram 8gb, ssd 256gb', 'còn hàng'),
('p004', 'dell xps 13', 35000000.00, 0, 'máy tính xách tay cao cấp dell, màn hình vô cực', 'hết hàng'),
('p005', 'sony wh-1000xm5', 6490000.00, 20, 'tai nghe chống ồn chủ động cao cấp', 'còn hàng');

create unique index idx_code
on products(product_code);

create index idx_product
on products(product_name, product_price);

explain select * from products where product_code = 'p001';
explain select * from products where product_name = 'iphone 15 pro' and product_price = 28990000.00;

create view view_info as
select product_code,product_name,product_price,product_status 
from products;

select * from view_info;

create or replace view view_info as
select 
    product_code, 
    product_name, 
    product_price, 
    product_amount, 
    product_status
from 
    products;
    
drop view if exists view_info;

delimiter //
create procedure sp_get_all_products()
begin 
select * from products;
end //
delimiter ;

delimiter //
create procedure sp_insert_product(
in p_product_code varchar(20),
in p_product_name varchar(20),
in p_product_price decimal(10,2),
in p_product_amount int,
in p_product_description text,
in p_product_status varchar(50)
)
begin
insert into products(
product_code,
product_nam,
product_price,
product_amount,
product_description,
product_status
) values (
p_product_code ,
p_product_name ,
p_product_price ,
p_product_amount ,
p_product_description ,
p_product_status 
);
end //
delimiter ;


delimiter //
create procedure sp_update_product_by_id(
    in p_id int,
    in p_product_code varchar(20),
    in p_product_name varchar(100),
    in p_product_price decimal(10, 2),
    in p_product_amount int,
    in p_product_description text,
    in p_product_status varchar(50)
)
begin
    update products 
    set 
        product_code = p_product_code,
        product_name = p_product_name,
        product_price = p_product_price,
        product_amount = p_product_amount,
        product_description = p_product_description,
        product_status = p_product_status
    where 
        id = p_id;
end //
delimiter ;
