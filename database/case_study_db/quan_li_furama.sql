create database if not exists quan_li_furama;
use quan_li_furama;

create table vi_tri(
vi_tri_id int primary key auto_increment,
ten_vi_tri varchar(45)
);

create table trinh_do(
trinh_do_id int primary key auto_increment,
ten_trinh_do varchar(45)
);

create table bo_phan(
bo_phan_id int primary key auto_increment,
ten_bo_phan varchar(45)
);

create table nhan_vien(
nhan_vien_id int primary key auto_increment,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
vi_tri_id int,
trinh_do_id int,
bo_phan_id int,
foreign key(vi_tri_id) references vi_tri(vi_tri_id),
foreign key(trinh_do_id) references trinh_do(trinh_do_id),
foreign key(bo_phan_id) references bo_phan(bo_phan_id)
);

create table loai_khach(
loai_khach_id int primary key auto_increment,
ten_loai_khach varchar(45)
);

create table khach_hang(
khach_hang_id int primary key auto_increment,
loai_khach_id int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key(loai_khach_id) references loai_khach(loai_khach_id)
);

create table kieu_thue(
kieu_thue_id int primary key auto_increment,
ten_kieu_thue varchar(45)
);

create table loai_dich_vu(
loai_dich_vu_id int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);

create table dich_vu(
dich_vu_id int primary key auto_increment,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
kieu_thue_id int,
loai_dich_vu_id int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
foreign key(kieu_thue_id) references kieu_thue(kieu_thue_id),
foreign key(loai_dich_vu_id) references loai_dich_vu(loai_dich_vu_id)
);

create table hop_dong(
hop_dong_id int primary key auto_increment,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
nhan_vien_id int,
khach_hang_id int,
dich_vu_id int,
foreign key(nhan_vien_id) references nhan_vien(nhan_vien_id),
foreign key(khach_hang_id) references khach_hang(khach_hang_id),
foreign key(dich_vu_id) references dich_vu(dich_vu_id)
);

create table dich_vu_di_kem(
dich_vu_di_kem_id int primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45)
);

create table hop_dong_chi_tiet(
hop_dong_chi_tiet_id int primary key auto_increment,
hop_dong_id int,
dich_vu_di_kem_id int,
so_luong int,
foreign key(hop_dong_id) references hop_dong(hop_dong_id),
foreign key(dich_vu_di_kem_id) references dich_vu_di_kem(dich_vu_di_kem_id)
);

-- cau 1
insert into vi_tri(ten_vi_tri) values
('Quản Lý'),
('Nhân Viên');

insert into trinh_do(ten_trinh_do) values
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

insert into bo_phan(ten_bo_phan) values 
('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');

insert into nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, vi_tri_id, trinh_do_id, bo_phan_id) values
('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
('Nguyễn Bỉnh Phát', '1999-12-09', '454363211', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
('Nguyễn Hữu Hà', '1993-01-01', '534321231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
('Nguyễn Hà Đông', '1989-09-03', '234412123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
('Tòng Hoang', '1982-09-03', '256789456', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
('Nguyễn Công Đạo', '1994-01-08', '754321345', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);

insert into loai_khach (ten_loai_khach) values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into khach_hang (ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, loai_khach_id) values
('Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
('Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
('Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', 1),
('Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
('Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Nguyễn Tri Phương, Gia Lai', 4),
('Tôn Thất Tùng', '1971-12-30', 1, '745321345', '0935141141', 'tungton@gmail.com', '234 Hoàng Diệu, Đà Nẵng', 2),
('Nguyễn Mỹ Kim', '1984-04-08', 0, '754321345', '0307531590', 'kimnguyen@gmail.com', '21 Nguyễn Văn Linh, Kon Tum', 1),
('Nguyễn Đức Chiên', '1989-06-03', 1, '454321234', '0356175395', 'chiennguyen@gmail.com', '30 Lý Thái Tổ, Điện Biên', 1),
('Lê Quang Hải', '1989-09-03', 1, '454321234', '0456175395', 'haile@gmail.com', '23 Nguyễn Chí Thanh, Đà Nẵng', 1),
('Nguyễn Tâm Đắc', '1989-07-01', 1, '344321234', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', 2);

insert into kieu_thue (ten_kieu_thue) values
('year'),
('month'),
('day'),
('hour');

insert into loai_dich_vu (ten_loai_dich_vu) values
('Villa'),
('House'),
('Room');

insert into dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, kieu_thue_id, loai_dich_vu_id) values
('Villa Beach Front', 25000, 10000000, 10, 'vip', 'Có hồ bơi', 500, 4, 3, 1),
('House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, 3, 2, 2),
('Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', null, null, 4, 3),
('Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, 3, 3, 1),
('House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', null, 2, 3, 2),
('Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', null, null, 4, 3);

insert into dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai) values
('Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
('Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
('Thuê xe đạp', 20000, 'chiếc', 'tốt'),
('Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, nhan_vien_id, khach_hang_id, dich_vu_id) values
('2020-12-08', '2020-12-08', 0, 3, 1, 3),
('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
('2021-07-14', '2021-07-15', 0, 7, 2, 6),
('2021-06-01', '2021-06-03', 0, 7, 7, 6),
('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
('2020-11-19', '2020-11-19', 0, 3, 4, 3),
('2021-04-12', '2021-04-14', 0, 10, 3, 5),
('2021-04-25', '2021-04-25', 0, 2, 2, 1),
('2021-10-22', '2021-10-23', 0, 7, 6, 1);

insert into hop_dong_chi_tiet (so_luong, hop_dong_id, dich_vu_di_kem_id) values
(5, 2, 4),
(8, 2, 5),
(15, 2, 6),
(1, 3, 1),
(11, 3, 2),
(1, 1, 3),
(2, 1, 2),
(2, 12, 2);

-- cau 2
select * from nhan_vien
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%'
and char_length(ho_ten)<=15;

-- cau 3
select * from khach_hang
where (year(now()) - year(ngay_sinh)) between 18 and 50 
and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');

-- cau 4
select kh.khach_hang_id,kh.ho_ten, count(hd.khach_hang_id) as so_lan_dat_phong
from khach_hang kh
join loai_khach lk 
on kh.loai_khach_id = lk.loai_khach_id
join hop_dong hd
on kh.khach_hang_id = hd.khach_hang_id
where lk.ten_loai_khach = 'Diamond'
group by kh.khach_hang_id, kh.ho_ten
order by so_lan_dat_phong asc;

-- cau 5
select kh.khach_hang_id,
 kh.ho_ten,
 lk.ten_loai_khach,
 hd.hop_dong_id,
 dv.ten_dich_vu,
 hd.ngay_lam_hop_dong,
 hd.ngay_ket_thuc, 
 sum(dv.chi_phi_thue + (hdct.so_luong * dvdk.gia)) as tong_tien 
from khach_hang kh
left join loai_khach lk on kh.loai_khach_id = lk.loai_khach_id
left join hop_dong hd on kh.khach_hang_id = hd.khach_hang_id
left join dich_vu dv on hd.dich_vu_id = dv.dich_vu_id
left join hop_dong_chi_tiet hdct on hdct.hop_dong_id = hd.hop_dong_id
left join dich_vu_di_kem dvdk on hdct.dich_vu_di_kem_id = dvdk.dich_vu_di_kem_id
group by kh.khach_hang_id,
 kh.ho_ten,
 lk.ten_loai_khach,
 hd.hop_dong_id,
 dv.ten_dich_vu,
 hd.ngay_lam_hop_dong,
 hd.ngay_ket_thuc;

-- cau 6
select dv.dich_vu_id, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.loai_dich_vu_id = ldv.loai_dich_vu_id
left join hop_dong hd on dv.dich_vu_id = hd.dich_vu_id
and month(ngay_lam_hop_dong) in (1,2,3)
and year(ngay_lam_hop_dong) = 2021
where hd.dich_vu_id is null;

-- cau 7
select distinct dv.dich_vu_id, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.loai_dich_vu_id = ldv.loai_dich_vu_id
join hop_dong hd on dv.dich_vu_id = hd.dich_vu_id 
where year(hd.ngay_lam_hop_dong) = 2020
and dv.dich_vu_id not in (
	select dich_vu_id
    from hop_dong
    where year(ngay_lam_hop_dong) = 2021
);

-- cau 8
-- c1
select ho_ten from khach_hang;

-- cau 9
select month(ngay_lam_hop_dong) as thang, count(khach_hang_id) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by thang asc;

-- cau 10
select distinct hd.hop_dong_id, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(bang_ao.so_luong, 0) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.hop_dong_id = hdct.hop_dong_id
left join (select hop_dong_id, sum(so_luong) as so_luong
	  from hop_dong_chi_tiet
      group by hop_dong_id
)as bang_ao on hd.hop_dong_id = bang_ao.hop_dong_id;

-- cau 11
select dvdk.* 
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct
on dvdk.dich_vu_di_kem_id = hdct.dich_vu_di_kem_id
join hop_dong hd
on hdct.hop_dong_id = hd.hop_dong_id
join khach_hang kh
on hd.khach_hang_id = kh.khach_hang_id
join loai_khach lk
on kh.loai_khach_id = lk.loai_khach_id
where (lk.ten_loai_khach = 'Diamond') 
and (kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quảng Ngãi%');

-- cau 12
select hd.hop_dong_id, nv.ho_ten as ho_ten_nv, kh.ho_ten as ho_ten_khach, kh.so_dien_thoai as sdt_khach,dv.dich_vu_id, dv.ten_dich_vu, bang_hdct.so_luong, hd.tien_dat_coc
from hop_dong hd
left join nhan_vien nv on hd.nhan_vien_id = nv.nhan_vien_id
left join khach_hang kh on hd.khach_hang_id = kh.khach_hang_id
left join dich_vu dv on hd.dich_vu_id = dv.dich_vu_id
left join (
	select hop_dong_id, sum(so_luong) as so_luong
    from hop_dong_chi_tiet 
    group by hop_dong_id
) as bang_hdct on bang_hdct.hop_dong_id = hd.hop_dong_id
where month(hd.ngay_lam_hop_dong) in (10,11,12)
and year (hd.ngay_lam_hop_dong) = 2020
and dv.dich_vu_id not in(
select dich_vu_id
from hop_dong
where year(ngay_lam_hop_dong) = 2021
);

-- cau 13
select
    dvdk.dich_vu_di_kem_id,
    dvdk.ten_dich_vu_di_kem,
    sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct
    on dvdk.dich_vu_di_kem_id = hdct.dich_vu_di_kem_id
group by
    dvdk.dich_vu_di_kem_id,
    dvdk.ten_dich_vu_di_kem
having sum(hdct.so_luong) = (
    select max(tong_so_luong)
    from (
        select
            sum(so_luong) as tong_so_luong
        from hop_dong_chi_tiet
        group by dich_vu_di_kem_id
    ) temp
);

-- cau 14
select
    hd.hop_dong_id,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    count(hdct.dich_vu_di_kem_id) as so_lan_su_dung
from hop_dong hd
join dich_vu dv on hd.dich_vu_id = dv.dich_vu_id
join loai_dich_vu ldv on dv.loai_dich_vu_id = ldv.loai_dich_vu_id
join hop_dong_chi_tiet hdct on hd.hop_dong_id = hdct.hop_dong_id
join dich_vu_di_kem dvdk on hdct.dich_vu_di_kem_id = dvdk.dich_vu_di_kem_id
group by
    hd.hop_dong_id,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem
having count(hdct.dich_vu_di_kem_id)=1;

-- cau 15
select
    nv.nhan_vien_id,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
from nhan_vien nv
join trinh_do td
on nv.trinh_do_id = td.trinh_do_id
join bo_phan bp
on nv.bo_phan_id = bp.bo_phan_id
left join hop_dong hd
on nv.nhan_vien_id = hd.nhan_vien_id
and year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by
    nv.nhan_vien_id,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
having count(hd.hop_dong_id) <= 3;

-- cau 16
delete from nhan_vien
where not exists (
    select *
    from (
        select
            nv.nhan_vien_id
        from nhan_vien nv
        join hop_dong hd
            on nv.nhan_vien_id = hd.nhan_vien_id
        where year(hd.ngay_lam_hop_dong) between 2019 and 2021
        group by nv.nhan_vien_id
    ) t
    where t.nhan_vien_id = nhan_vien.nhan_vien_id
);

-- cau 17
update khach_hang
set loai_khach_id = (
    select loai_khach_id
    from loai_khach
    where ten_loai_khach = 'Diamond'
)
where khach_hang_id in (
    select *
    from (
        select hd.khach_hang_id
        from hop_dong hd
        join dich_vu dv on hd.dich_vu_id = dv.dich_vu_id
        left join hop_dong_chi_tiet hdct on hd.hop_dong_id = hdct.hop_dong_id
        left join dich_vu_di_kem dvdk on hdct.dich_vu_di_kem_id = dvdk.dich_vu_di_kem_id
        where year(hd.ngay_lam_hop_dong)=2021
        group by
            hd.hop_dong_id,
            hd.khach_hang_id,
            dv.chi_phi_thue
        having
            dv.chi_phi_thue
            + ifnull(sum(hdct.so_luong*dvdk.gia),0)
            >10000000
    ) t
);
