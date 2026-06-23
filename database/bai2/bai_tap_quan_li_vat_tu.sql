create database if not exists quan_li_vat_tu;
use quan_li_vat_tu;

create table nha_cc(
ma_ncc varchar(10) primary key,
ten_ncc varchar(100) not null,
dia_chi varchar(100) not null
);

create table so_dt(
so_dt varchar(20),
ma_ncc varchar(10),
primary key(ma_ncc, so_dt),
foreign key (ma_ncc) references nha_cc(ma_ncc)
);

create table don_hang(
so_dh varchar(10) primary key,
ngay_dh date,
ma_ncc varchar(10),
foreign key (ma_ncc) references nha_cc(ma_ncc)
);

create table vat_tu(
ma_vt varchar(10) primary key,
ten_vt varchar(100)
);

create table phieu_nhap(
so_pn varchar(10) primary key,
ngay_nhap date
);

create table phieu_xuat(
so_px varchar(10) primary key,
ngay_xuat date
);

create table chi_tiet_phieu_xuat(
don_gia_xuat int,
so_luong_xuat int,
so_px varchar(10),
ma_vt varchar(10),
primary key(so_px, ma_vt),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vt) references vat_tu(ma_vt)
);

create table chi_tiet_phieu_nhap(
don_gia_nhap int,
so_luong_nhap int,
so_pn varchar(10),
ma_vt varchar(10),
primary key(so_pn, ma_vt),
foreign key(so_pn) references phieu_nhap(so_pn),
foreign key(ma_vt) references vat_tu(ma_vt)
);

create table chi_tiet_don_dat_hang(
so_luong int,
so_dh varchar(10),
ma_vt varchar(10),
primary key(so_dh, ma_vt),
foreign key(so_dh) references don_hang(so_dh),
foreign key(ma_vt) references vat_tu(ma_vt)
);

