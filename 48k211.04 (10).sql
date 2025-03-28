USE master;  
GO  
IF DB_ID (N'QLNS') IS NOT NULL  
DROP DATABASE QLNS;  
GO  
CREATE DATABASE QLNS
go
use QLNS
go


--Tao bang ChuQuan
CREATE TABLE ChuQuan
(
	SoCCCD CHAR(12) unique,
	TenChuQuan NVARCHAR(50) NOT NULL,
	TuoiChuQuan INT NOT NULL,
    NoiOHienTai NVARCHAR(50) NOT NULL,
    SoDienThoai CHAR(10) UNIQUE,
    Username CHAR(12) NOT NULL,
    Pass VARCHAR(20) NOT NULL,
	PRIMARY KEY (SoCCCD)
)
go

--Tao bang NhanVien
CREATE TABLE NhanVien 
(
    MaDangNhap CHAR(12) NOT NULL PRIMARY KEY,
    CCCD CHAR(12) UNIQUE,
    TenNV NVARCHAR(50) NOT NULL,
    TuoiNV INT NOT NULL,
    DiaChi NVARCHAR(60) NOT NULL,
    SDT CHAR(10) UNIQUE,
    SoTaiKhoanNH VARCHAR(20) NOT NULL,
    MatKhau VARCHAR(20) NOT NULL
)
go

--Tao bang CapBacNV
CREATE TABLE CapBacNV 
(
    MaDangNhap CHAR(12) NOT NULL,
    CapBac CHAR(2) NOT NULL,
    PRIMARY KEY (MaDangNhap),
    FOREIGN KEY (MaDangNhap) REFERENCES NhanVien
)
go
--Tao bang Luong
Create table Luong 
(	
	MaBangLuong char(4) not null, 
	SoGioLamTrongThang int not null, 
	SoGioBatDauLam int not null, 
	TienLuong int not null,
	primary key (MaBangLuong)
)
go
--Tao bang LuongNV
Create table LuongNV
(	
	MaDangNhap char(12) not null,
	MaBangLuong char(4) not null,
	primary key (MaDangNhap, MaBangLuong),
	foreign key (MaDangNhap) references NhanVien,
	foreign key (MaBangLuong) references Luong
)
go

--Tao bang ChamCong
CREATE TABLE ChamCong 
(
	MaBangChamCong CHAR (4) NOT NULL,
	NgayChamCong DATE NOT NULL,
	TGVaoCa DATETIME NOT NULL,
	TGRaCa DATETIME NOT NULL,
	CaLam VARCHAR (10) NOT NULL,
	PRIMARY KEY ( MaBangChamCong )
)
go

--Tao bang ChamCongNV
CREATE TABLE ChamCongNV
(
	MaBangChamCong CHAR (4) NOT NULL,
	MaDangNhap CHAR (12) NOT NULL,
	PRIMARY KEY ( MaBangChamCong, MaDangNhap ),
	FOREIGN KEY ( MaBangChamCong ) REFERENCES ChamCong,
	FOREIGN KEY ( MaDangNhap ) REFERENCES NhanVien
)
go

--Tao bang ThongBao
CREATE TABLE ThongBao 
(
    MaTB char(4) not null PRIMARY KEY,
    TenThongBao NVARCHAR(100) not null,
    ThoiGianThongBao DATETIME not null ,
    NoiDungThongBao nvarchar(200) not null 
)
go

--Tao bang ThongBaoNV
CREATE TABLE ThongBaoNV 
(
    MaTB char(4) not null ,
    MaDangNhap char(12) not null ,
    PRIMARY KEY (MaTB, MaDangNhap),
    FOREIGN KEY (MaTB) REFERENCES ThongBao,
    FOREIGN KEY (MaDangNhap) REFERENCES NhanVien
)
go

--Tao bang LichLam
CREATE TABLE LichLam 
(
    MaBang char(4) PRIMARY KEY,				
    NgayLam DATE NOT NULL,                   
    CaLam VARCHAR(10) NOT NULL,             
    NgayNghi DATE                            
)
go
--Tao bang LichLamNV
CREATE TABLE LichLamNV 
(
    MaBang CHAR(4),                             
    MaDangNhap CHAR(12),						
    PRIMARY KEY (MaBang, MaDangNhap),			
    FOREIGN KEY (MaBang) REFERENCES LichLam,
    FOREIGN KEY (MaDangNhap) REFERENCES NhanVien
)
go


	