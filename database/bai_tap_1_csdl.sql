create database trung_tam_tin_hoc;
use trung_tam_tin_hoc;
create table khoa_hoc(
	ma_khoa char(5) primary key ,
    ten_khoa_hoc varchar(100) not null,
    hoc_phi int,
    trang_thai varchar(20) default('Sap mo')
);

insert into khoa_hoc(ma_khoa,ten_khoa_hoc,hoc_phi,trang_thai) values('JV001', 'Lap trinh java',5000000,'Dang mo');
insert into khoa_hoc(ma_khoa,ten_khoa_hoc,hoc_phi) values('PY002', 'Lap trinh python',4500000);
insert into khoa_hoc(ma_khoa,ten_khoa_hoc,hoc_phi,trang_thai) values('DB003', 'Co so du lieu SQL',3000000,'Dang mo');
select * from khoa_hoc;

alter table khoa_hoc add thoi_gian_hoc int;
alter table khoa_hoc add giang_vien varchar(50) not null default('Chua xep');

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
update khoa_hoc set thoi_gian_hoc = 60 where ma_khoa = 'JV001';
update khoa_hoc set hoc_phi = hoc_phi + 500000 where trang_thai = 'Dang mo';
update khoa_hoc set giang_vien = 'Thay Tuan' where ma_khoa = 'PY002';

delete from khoa_hoc where hoc_phi < 4000000;
select * from khoa_hoc where hoc_phi between 4000000 and 6000000;
select * from khoa_hoc where ten_khoa_hoc like '%trinh%';