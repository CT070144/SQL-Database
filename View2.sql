/* Bài 2: Cho CSDL như sau:
		NHANVIEN(MaNV, Hoten, DiaChi, SDT, NgaySinh, GT, HSL)
		HANG(MaHang, TenHang, NhaSX, TGianBaoHanh)
		KHACHHANG(MaKH, TenKH, CMT, DiaChi, SoDienThoai, Email)
		HOADONXUAT(MaHD, MaKH, NgayLapHD, MaNV, PhuongThucTT)
		CT_HOADON(MaHD, MaHang, SoLuongMua, DonGia)
		Sinh viên tự thiết kế kiểu dữ liệu, nhập mỗi bảng ít nhất 5 bản ghi.
*/
create database HangHoa
use HangHoa
create table NHANVIEN(
	MaNV  char(10) primary key,
	Hoten Nvarchar(30) not null,
	DiaChi Nvarchar(50) not null, 
	SDT nvarchar(20)  not null, 
	NgaySinh date  check (Ngaysinh<getdate()), 
	GT nvarchar(10) default 'Nam', 
	HSL int not null
)
INSERT INTO NHANVIEN(MANV,HOTEN,DIACHI,SDT,NGAYSINH,GT,HSL) VALUES (N'HN004',N'Trần Bảo Trọng',
N'141 Chiến Thắng-Tân Triều-Thanh Trì-Hà Nội','0987654321','1995-11-20',N'Nam','4'),
(N'HN016',N'Trần Phương Thảo',N'290 Phan Bá Vành-Bắc Từ Liêm-Hà Nội','0986868686','1999-09-09',N'Nữ','3'),
(N'NA009',N'Phạm Thị Hương Giang',N'Yên Thành-Nghệ An','0385858585','1999-09-20',N'Nữ','2'),
(N'NA006',N'Nguyễn Văn Quyền',N'Quang Thàh-Yên Thành-Nghệ An','0339350910','1999-09-20',N'Nam','4'),
(N'TH010',N'Trần Nhật Quỳnh',N'Hoằng Hóa-Thanh Hóa','0355954923','1999-09-20',N'Nữ','3')



create table HANG(
	MaHang char(20) primary key, 
	TenHang nvarchar(50) not null, 
	NhaSX nvarchar(50) not null, 
	TGianBaoHanh date check (TGianBaoHanh > getdate()) not null
)

insert into HANG(MAHANG,TENHANG,NHASX,TGIANBAOHANH) VALUES (N'BC56347',N'Bánh đậu xanh',N'Đông Tây','2021-12-18'),
(N'C32572M2',N'Thịt bò khô',N'Love Food','2023-12-30'),(N'BK152CM2',N'nồi cơm điện',N'Panasonic','2024-06-30'),
(N'MN124HF',N'Áo hoodie',N'Mạnh Phát','2025-12-03'),(N'MKN3436',N'Xe máy EX',N'Toyota','2026-01-02')

create table KHACHHANG(
	MaKH char(10) primary key, 
	TenKH Nvarchar(30) not null, 
	CMT nvarchar(20)  not null, 
	DiaChi Nvarchar(50) not null, 
	SoDienThoai nvarchar(20)  not null, 
	Email nvarchar(50)  not null,
)

INSERT INTO KHACHHANG(MAKH,TENKH,CMT,DIACHI,SODIENTHOAI,EMAIL) VALUES (068432,N'Phạm Văn Anh Tuấn','187809726',
N'Sao Vàng-Kim Thành-Yên Thành-Nghệ An','0385364532',N'tuan01022001@gmail.com'),
(068537,N'Phạm Đình Thông','187829726',N'Giao Thủy-Nam Định','0367031829',N'thong01012000@gmail.com'),
(069654,N'Phạm Nhật Linh','187829856',N'Thuận Hóa-Hòa Bình','0367035555',N'Nlinh05555@gmail.com'),
(0238432,N'Nguyễn Thị Diệu','197823724',N'Kim Thanh-Giao Thủy-Nam Định','038531829',N'dieungok@gmail.com'),
(12642,N'Nguyễn Cảnh Dinh','186732434',N'Mường Cao-Lạng Sơn','0389214583',N'Canhdinh2k1@gmail.com')

create table HOADONXUAT(	
	MaHD char(20) primary key, 
	MaKH char(10), 
	NgayLapHD  date  check (NgayLapHD < getdate()), 
	MaNV char(10), 
	PhuongThucTT Nvarchar(50)
)

INSERT INTO HOADONXUAT(MAHD,MAKH,NGAYLAPHD,MANV,PHUONGTHUCTT) VALUES (197286581,068537,'2020-12-11',
N'TH010',N'Tiền mặt'),(725682381,0238432,'2019-10-08',N'NA009',N'Banking'),
(162576215,068432,'2021-01-30',N'HN016',N'Tiền Mặt'),(52342256,12642,'2020-05-26',N'HN016',N'Tiền mặt'),
(532742178,069654,'2020-03-01',N'NA006',N'Tiền Mặt'),(32583859,068432,'2020-01-19',N'HN004',N'Banking'),
(642481249,12642,'2020-04-18',N'HN004',N'Banking'),(325782336,068432,'2020-05-11',N'NA006',N'Tiền mặt'),
(325782342,069654,'2021-05-16',N'NA006',N'Banking'),(43423256,068537,'2020-09-09',N'NA006',N'Tiền mặt')

Alter Table HOADONXUAT
Add
Constraint FK_HDX foreign key (MaKH) References KHACHHANG(MaKH)
Alter Table HOADONXUAT
Add
Constraint FK_HDX1 foreign key (MaNV) References NHANVIEN(MaNV)

create table CT_HOADON(
	MaHD char(20), 
	MaHang char(20), 
	SoLuongMua int not null, 
	DonGia int not null,
	constraint RB_HD primary key (MaHD,MaHang)
)
insert into CT_HOADON(maHD,maHang,SoLuongMua,DonGia) values (197286581,N'BC56347',25,30000),
(52342256,N'BK152CM2',10,550000),(32583859,N'BK152CM2',2,55000),(725682381,N'MKN3436',1,15000000),
(162576215,N'C32572M2',5,230000),(325782342,N'MN124HF',23,330000),(532742178,N'BC56347',50,30000),
(642481249,N'MKN3436',1,15000000),(43423256,N'C32572M2',20,230000),(325782336,N'BK152CM2',17,550000)

use hanghoa
SELECT * FROM NHANVIEN
SELECT * FROM HANG
SELECT * FROM KHACHHANG
SELECT * FROM HOADONXUAT
SELECT * FROM CT_HOADON
--1.Tạo View chứa danh sách nhân viên nữ
 create view we as
 select * from NHANVIEN
  where gt like N'Nữ'
  select * from we
--2.Tạo View chứa danh sách nhân viên với các thông tin: mã nhân viên, họ tên, giới tính và tuổi
 create view nhanvien2(manv,ten,gt,tuoi) as
 select manv,hoten,gt, year(getdate()) - year(ngaysinh) as tuoi
 from nhanvien
 select * from nhanvien2
 --3.Tạo View cho biết họ tên của khách hàng đã mua tổng số tiền hàng > 10 triệu
  select*from khachhang
  select * from ct_hoadon

  --Tạo view tính tổng tiền hàng trên mỗi khách hàng
 alter view tonghoadon(makh,tenkh) as
  select x.makh,tenkh
  from ct_hoadon as ct join hoadonxuat as x on ct.mahd=x.mahd
  join khachhang as kh on kh.makh=x.makh
  group by x.makh,tenkh
  having sum(soluongmua*dongia) > 10000000
  
  select tenkh
  from tonghoadon

  --Tạo View cho biết họ tên của nhân viên đã bán được > 20 triệu tiền hàng

  --Tạo view tính tổng tiền bán được của mỗi nhân viên
  create view tongtienban(ma,ten,tongban) as
  select hd.manv,hoten,sum(soluongmua*dongia) 
  from ct_hoadon as ct join hoadonxuat as hd on ct.mahd=hd.mahd
  join nhanvien as nv on nv.manv=hd.manv
  group by hd.manv,hoten
  --having sum(soluongmua*dongia) > 20000000
  select * from tongtienban
  select ten,tongban
  from tongtienban
  where tongban > 20000000