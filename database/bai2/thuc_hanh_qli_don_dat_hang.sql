create database if not exists quan_li_don_dat_hang;
use quan_li_don_dat_hang;

create table dv_khach(
ma_dv varchar(10) primary key,
ten_dv varchar(100),
dia_chi varchar(200),
dien_thoai varchar(20)
);

create table nguoi_dat(
ma_so_nd varchar(10) primary key ,
ho_ten_nd varchar(50),
ma_dv varchar(10),
foreign key(ma_dv) references dv_khach(ma_dv)
);

create table nguoi_nhan(
ma_so_nn varchar(10) primary key ,
ho_ten_nn varchar(50),
ma_dv varchar(10),
foreign key(ma_dv) references dv_khach(ma_dv)
);

create table hang(
ma_hang varchar(10) primary key ,
ten_hang varchar(100),
don_vi_tinh varchar(50),
mo_ta_hang varchar(200)
);

create table nguoi_giao(
ma_so_ng varchar(10) primary key ,
ho_ten_ng varchar(100)
);

create table noi_giao(
ma_so_ddg varchar(10) primary key ,
ten_noi_giao varchar(200)
);

create table dat(
so_dh varchar(10) primary key,
ngay_dat date,
so_luong int,
ma_nd varchar(10),
ma_hang varchar(10),
foreign key(ma_nd) references nguoi_dat(ma_so_nd),
foreign key(ma_hang) references hang(ma_hang)
);

create table giao(
so_pg varchar(10) primary key,
ngay_giao date,
so_luong int,
don_gia double,
ma_nn varchar(10),
ma_ng varchar(10),
ma_hang varchar(10),
ma_noi_giao varchar(10),
foreign key(ma_nn) references nguoi_nhan(ma_so_nn),
foreign key(ma_ng) references nguoi_giao(ma_so_ng),
foreign key(ma_hang) references hang(ma_hang),
foreign key(ma_noi_giao) references noi_giao(ma_so_ddg)
);
