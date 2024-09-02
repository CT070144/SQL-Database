create database QLTV
/* Tên Sách giống nhau và mã sách khác nhau */
use QLTV

create table Bandoc(
 maBD     varchar(20) primary key,
 tenBD    nvarchar(50) not null,
 ngaysinh date check(ngaysinh < getdate()),
 lop      nvarchar(50) not null,
 quequan nvarchar(50) not null,
 sdt      nvarchar(50) not null)
 
 create table Sach(
 maSach  varchar(20) primary key,
 tenSach nvarchar(50) not null,
 TheLoai nvarchar(50) not null,
 Tacgia  nvarchar(50) not null,
 NamXB   int,
 NhaXB   nvarchar(50) not null)

 create table Phieumuon(
 maBD     varchar(20) foreign key references Bandoc(maBD),
 maSach   varchar(20) foreign key references Sach(maSach),
 Ngaymuon date,
 Ngaytra  date,
 Trasach  bit default('0'),
 constraint PK_Phieumuon primary key (maBD,maSach),
 constraint checktra check(datediff(day,ngaymuon,ngaytra) <= 5),
 )
 drop table Phieumuon
 use Thu_vien
 insert into Bandoc
 values ('BD12',N'Nguyễn Văn Khoa','2000-01-16',N'12A3',N'Hà Nội',N'09017734567'),
('BD13',N'Trần Thị Bình','2001-03-23',N'11B2',N'Cần Thơ',N'0902395678'),
('BD14',N'Lê Văn Cường','2002-05-11',N'12C3',N'Nghệ An',N'0963456789'),
('BD04',N'Phạm Thị D','2000-07-30',N'12A2',N'Hải Phòng',N'0904567890'),
('BD05',N'Võ Văn E','2001-09-14',N'11B3',N'Cần Thơ',N'0905678901'),
('BD06',N'Hoàng Thị F','2002-11-05	',N'10C4',N'Bình Dương',N'0906789012'),
('BD07',N'Đặng Văn G','2000-12-25',N'12A3',N'Nha Trang',N'0907890123'),
('BD08',N'Bùi Thị H','2001-02-19',N'11B4',N'Vũng Tàu',N'0908901234'),
('BD09',N'Phan Văn I','2002-04-08',N'10C5',N'Quảng Nam',N'0909012345'),
('BD10',N'Nguyễn Thị K','2000-06-16',N'12A4',N'Bắc Ninh',N'0900123456')

insert into  Sach
values ('S01',N'Lập trình Python cơ bản',N'Công nghệ',N'Nguyễn Văn A','2020',N'Nhà Xuất Bản A'),
('S02',N'Hướng dẫn sử dụng MySQL',N'Công nghệ',N'Trần Thị B','2019',N'Nhà Xuất Bản B'),
('S03',N'Lịch sử Việt Nam',N'Lịch sử',N'Lê Văn C','2018',N'Nhà Xuất Bản C'),
('S04',N'Cấu trúc dữ liệu và giải thuật',N'Công nghệ',N'Phạm Thị D	','2021',N'Nhà Xuất Bản D'),
('S05',N'Văn học Việt Nam thời kỳ hiện đại',N'Văn học',N'Võ Văn E','2017',N'Nhà Xuất Bản E'),
('S06',N'Khoa học máy tính căn bản',N'Công nghệ',N'Hoàng Thị F','2022',N'Nhà Xuất Bản F'),
('S07',N'Toán học lớp 12',N'Giáo dục',N'Đặng Văn G','2020',N'Nhà Xuất Bản G'),
('S08',N'Sinh học đại cương',N'Giáo dục',N'Bùi Thị H','2019',N'Nhà Xuất Bản H'),
('S09',N'Hóa học lớp 11',N'Giáo dục',N'Phan Văn I','2021',N'Nhà Xuất Bản I'),
('S10',N'Kỹ thuật điện tử cơ bản',N'Kỹ thuật',N'Nguyễn Thị K','2018',N'Nhà Xuất Bản K')

insert into Phieumuon
values 
('BD11','S05','2023-09-03','2023-09-08','1'),
('BD11','S07','2023-08-15','2023-08-20','1'),
('BD11','S09','2023-08-01','2023-08-06','1'),
('BD02','S02','2023-08-02','2023-08-07','0'),
('BD03','S03','2023-09-03','2023-09-08','1'),
('BD04','S09','2023-08-04','2023-08-09','0'),
('BD05','S05','2023-08-05','2023-08-10','1'),
('BD06','S08','2023-08-06','2023-08-11','0'),
('BD07','S07','2023-08-07','2023-08-12','1'),
('BD08','S08','2023-08-08','2023-08-13','0'),
('BD09','S09','2023-08-09','2023-08-14','1'),
('BD10','S10','2023-08-10','2023-08-19','0'),
('BD01','S09','2023-08-15','2023-08-20','1')
 drop table phieumuon,drop table sach, drop table bandoc
 use Thu_vien
 select*from Bandoc
 select*from Sach
 select*from Phieumuon

 --1. Xem bạn có mã bạn đọc là HN123 đã mượn những quyển sách nào ( in mã sách và tên sách)
  select pm.masach,tensach
  from phieumuon as pm, sach as s
  where pm.maSach=s.maSach and mabd='BD01'
--2. Có bao nhiêu cuốn thiểu thuyết ( công nghệ) đã được mượn vào tháng 8/2023
 select count(pm.masach)
 from phieumuon as pm, sach as s
 where  pm.maSach=s.maSach and Theloai like N'Công nghệ' and ngaymuon between '2023/08/05' and '2023/08/15'
 --3. Hiện thị về việc mượn sách của những độc giả quê ở Hà nội
  select * 
  from phieumuon as pm , bandoc as bd
  where pm.mabd=bd.mabd and bd.quequan=N'Hà Nội'
 --4. Hiển thị mã bạn đọc và tên của các bạn cùng mượn sách có mã là T123
 select bd.mabd,tenbd
 from bandoc as bd,phieumuon as pm
  where pm.mabd=bd.mabd and masach like 'S03'
--5. Hiển thị danh sách bạn đọc quê ở Bắc Ninh và chưa trả sách
 select tenbd,bd.mabd,ngaymuon,trasach
 from bandoc as bd,phieumuon as pm
 where pm.mabd=bd.mabd and trasach='0' and quequan like N'Hà Nội'
--6. Hiển thị bạn đọc quê ở Hà nội mượn nhiều sách nhất 

 select top 1 bd.mabd,tenbd,count(pm.masach) as soluong
 from phieumuon pm, bandoc bd
 where pm.mabd=bd.mabd and quequan like N'Hà Nội'
 group by bd.mabd,tenbd 
 order by count(pm.masach) DESC

 --7. Tính số lượng sách của mỗi thể loại có trong thư viện
 select theloai,count(masach)
 from sach
 group by theloai
 --8. Hiển thị các cuốn sách được in ở nhà xuất bản giáo dục trước năm 2010
 select *
 from sach
 where namxb < 2020
 --9. Hiển thị các bạn có mã bạn đọc nhưng chưa mượn sách bao giờ
 select mabd,tenbd
 from bandoc
 except 
 select bd.mabd,tenbd
 from phieumuon as pm left join bandoc as bd on pm.mabd=bd.mabd
 
 --10. Hiển thị các bạn mượn nhiều hơn hoặc bằng 2 quyển sách
 select pm.mabd,tenbd,count(masach) as [Số lượng]
 from  phieumuon as pm  join bandoc as bd on pm.mabd=bd.mabd
 group by pm.mabd,tenbd
 having count(masach)>=2 
 --11. Hiển thị các bạn mượn nhiều hơn hoặc bằng 3 quyển sách thuộc thể loại “Sách khoa học” vào tháng 10/2018
 select pm.mabd,tenbd,count(pm.masach) as [Số lượng]
 from  phieumuon as pm 
 join bandoc as bd on pm.mabd=bd.mabd
 join sach as s on s.masach=pm.masach
 where theloai like N'Công nghệ' and ngaymuon between '2023/08/01' and '2023/08/30'
 group by pm.mabd,tenbd
 having count(pm.masach)>=3
 --12. Hiển thị tổng số sách đã được mượn ở Thư viện
 select count(  masach)
 from phieumuon
 
 --13.Hiện thị mã và tên bạn đọc mượn sách nhiều hơn bạn có mã số là BN123
 select pm.mabd,tenbd,count(masach)
 from phieumuon as pm join bandoc as bd on pm.mabd=bd.mabd
 group by pm.mabd,tenbd
 having count(masach) >
( select count(masach)
  from phieumuon
  where mabd=N'BD01')
--14. Hiển thị mã và tên cuốn sách được mượn nhiều nhất,ít nhất ở Thư viện năm 2018
 
(select top 1 tensach,count(pm.masach) as soluong
from phieumuon as pm join sach as s on pm.masach = s.masach
where ngaymuon between '2023/01/01'and '2023/12/30'
 group by tensach
 order by soluong desc)
 
 (select top 1 tensach,count(pm.masach) as soluong
from phieumuon as pm join sach as s on pm.masach = s.masach
where ngaymuon between '2023/01/01'and '2023/12/30'
 group by tensach
 order by soluong asc)

 --15. Cho danh sách các bạn đọc mượn sách quá hạn tính đến ngày hiện tại
 select tenbd,pm.mabd,pm.masach,ngaytra,trasach
 from  phieumuon as pm join bandoc as bd on pm.mabd=bd.mabd
 where ngaytra < getdate() and trasach='0'

