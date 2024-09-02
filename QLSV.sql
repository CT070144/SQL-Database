
--Tạo cơ sở dữ liệu
create database QLSV

use QLSV

create table Sinhvien(
 Masv      int identity(1,1) primary key,
 Tensv     nvarchar(50) not null,
 Gioitinh  nvarchar(5) default('Nam'),
 Ngaysinh  date check(Ngaysinh < getdate()),
 Que       nvarchar(50),
 Lop       nvarchar(50) )

 alter table Sinhvien
 alter column Que nvarchar(50) not null;

drop table Sinhvien

sp_help Sinhvien
 
 create table Monhoc(
  Mamh   int identity primary key,
  Tenmh  nvarchar(50) unique,
  DVHT   int check(DVHT between 2 and 9) )

sp_help Monhoc

create table Ketqua(
  Masv          int foreign key references Sinhvien(Masv), 
  Mamh          int foreign key references Monhoc(Mamh), 
  Diem          float check (diem between 0 and 10),
  constraint    key1 primary key (Masv,Mamh) );

  drop table Ketqua
 
 -- Chèn dữ liệu
 use QLSV
  insert into Sinhvien
  values
 (N'Trần Bảo Trọng',N'Nam','1995-12-14',N'Hà Giang','L02'),
 (N'Lê Thùy Dương',N'Nữ','1997-05-12',N'Hà Nội','L02'),
(N'Trần Phương Thảo',N'Nữ','1996-03-30',N'Quảng Ninh',N'L01'),
(N'Lê Trường An',N'Nam','1995-11-20',N'Ninh Bình',N'L04'),
(N'Phạm Thị Hương Giang',N'Nữ','1999-02-21',N'Hòa Bình',N'L02'),
(N'Trần Anh Bảo',N'Nam','1995-12-14',N'Hà Giang',N'L02'),
(N'Lê Thùy Dung',N'Nữ','1997-05-12',N'Hà Nội',N'L03'),
(N'Phạm Trung Tính',N'Nam','1996-03-30',N'Quảng Ninh',N'L01'),
(N'Lê An Hải',N'Nam','1995-11-20',N'Ninh Bình',N'L04'),
(N'Phạm Thị Giang Hương',N'Nữ','1999-02-21',N'Hòa Bình',N'L02'),
(N'Đoàn Duy Thức',N'Nam','1994-04-12',N'Hà Nội',N'L01'),
(N'Dương Tuấn Thông',N'Nam','1991-04-12',N'Nam Định',N'L03'),
(N'Lê Thành Đạt',N'Nam','1993-04-15',N'Phú Thọ',N'L04'),
(N'Nguyễn Hằng Nga',N'Nữ','1993-05-25',N'Hà Nội',N'L01'),
(N'Trần Thanh Nga',N'Nữ','1994-06-20',N'Phú Thọ',N'L03'),
(N'Trần Trọng Hoàng',N'Nam','1995-12-14',N'An Giang',N'L02'),
(N'Nguyễn Mai Hoa',N'Nữ','1995-12-14',N'Hà Giang',N'L02'),
(N'Lê Thúy An',N'Nam','1998-03-23',N'Hà Nội',N'L01')

insert into monhoc
values(N'Toán cao cấp','3'),(N'Mạng máy tính','3'),(N'Tin đại cương','4')
select*from Sinhvien
use QLSV
insert into Ketqua
values('1','1','8'),
('1','2','5'),
('1','3','7'),
('2','1','9'),
('2','2','5'),
('2','3','2'),
('3','1','4'),
('3','2','2'),
('4','1','1'),
('4','2','3'),
('5','1','4'),
('6','1','2'),
('6','2','7'),
('6','3','9'),
('7','1','4'),
('7','2','5'),
('7','3','8'),
('8','1','9'),
('8','2','8'),
('9','1','7'),
('9','2','7'),
('9','3','5'),
('10','1','3'),
('10','3','6'),
('11','1','6'),
('12','1','8'),
('12','2','7'),
('12','3','5'),
('13','1','6'),
('13','2','5'),
('13','3','5'),
('14','1','8'),
('14','2','9'),
('14','3','7'),
('15','1','3'),
('15','2','6'),
('15','3','4')

  select * from Ketqua
  select * from Sinhvien
  select * from Monhoc
  
 /* drop table ketqua
  drop table SinhVien
  Drop table Monhoc */


  update Sinhvien
  set Gioitinh=N'Nữ'
  where Masv='18'

  select masv as [Mã Sinh Viên],tensv as Tên,ngaysinh as Born from sinhvien
  select * from sinhvien
  select *
  from Sinhvien
  where tensv like N'Trần %'
 select tensv,mamh,diem
from Ketqua,Sinhvien
where Sinhvien.masv=Ketqua.masv and  diem between 5 and 7
 
 select tensv,que
 from sinhvien
 where que in (N'Hà Nội',N'Phú Thọ')

 select *
 from sinhvien
 
 select sv.MaSV, TenSV as 'Tên Sinh Viên', TenMH, Diem
from ((Sinhvien as sv join Ketqua as kq on sv.MaSV = kq.MaSV) join Monhoc as Mh on kq.MaMH=mh.MaMH)

Select Sinhvien.MaSV as 'Mã Sinh viên',TenSV as 'Họ và tên', TenMH as 'Tên môn',Diem as 'Điểm',
Case
when (Diem<5) then N'Thi lại'
when (Diem >=5) and (Diem<7) then N'Trung bình'
when (Diem>=7) and (Diem<8) then N'Khá'
else N'Giỏi'
end as N'Xếp Loại'
from Sinhvien, Monhoc, Ketqua
where (Sinhvien.MaSV = Ketqua.MaSV) and (Monhoc.MaMH = Ketqua.MaMH)
use QLSV
select distinct sv.tensv
from sinhvien as sv,monhoc as mh,ketqua as kq
where sv.masv=kq.masv and mh.mamh=kq.mamh and mh.mamh=1
intersect
select distinct sv.tensv
from sinhvien as sv,monhoc as mh,ketqua as kq
where sv.masv=kq.masv and mh.mamh=kq.mamh and mh.mamh=3
select distinct tensv
from Sinhvien, Ketqua, Monhoc
where Sinhvien.MaSV = Ketqua.MaSV and Ketqua.MaMH = Monhoc.MaMH and Monhoc.MaMH=1
Intersect
select distinct tensv
from Sinhvien, Ketqua, Monhoc
where Sinhvien.MaSV = Ketqua.MaSV and Ketqua.MaMH = Monhoc.MaMH and Monhoc.MaMH=3

select lop,count(sv.masv)
from sinhvien as sv,ketqua as kq
where sv.masv=kq.masv and kq.diem < 5
group by lop

select mh.tenmh,count(sv.masv)
from sinhvien as sv,ketqua as kq,monhoc as mh
where sv.masv=kq.masv and mh.mamh=kq.mamh and kq.diem < 5
group by mh.tenmh

select lop,count(sv.masv)
from sinhvien as sv,ketqua as kq
where sv.masv=kq.masv and diem < 5
group by lop
having count(sv.masv)>1

select sv.masv,tensv
from sinhvien as sv join ketqua as kq on sv.masv=kq.masv
where mamh='1' and diem =
(select max(diem) 
from ketqua
where mamh='1')

select * 
from ketqua
where masv='7'

select max(diem)
from kq
where mamh='1'

select mh.mamh,tenmh,diem
from ketqua as kq
where masv='11'
--1.Cho biết mã môn học, tên môn học, điểm thi tất cả các môn của sinh viên tên Thức
 select mh.mamh,tenmh,diem
 from (ketqua as kq join sinhvien as sv on sv.masv=kq.masv )join monhoc as mh on mh.mamh=kq.mamh
 where tensv like  N'% Thức'
 -1.Cho biết mã môn học, tên môn học, điểm thi tất cả các môn của sinh viên tên Thức
 select mh.mamh,tenmh,diem
 from (ketqua as kq join sinhvien as sv on sv.masv=kq.masv )join monhoc as mh on mh.mamh=kq.mamh
 where tensv like  N'% Dung'
--2.Cho biết mã môn học, tên môn và điểm thi ở những môn mà sinh viên tên Dung phải thi lại (điểm<5)
 select mh.mamh,tenmh,diem
 from (ketqua as kq join sinhvien as sv on sv.masv=kq.masv )join monhoc as mh on mh.mamh=kq.mamh
 where tensv like  N'% Dung' and diem <5
 --3.Cho biết mã sinh viên, tên những sinh viên đã thi ít nhất là 1 trong 3 môn Lý thuyết Cơ sở dữ liệu, Tin học đại cương, Mạng máy tính

	select sv.masv,tensv
	from (sinhvien as sv join ketqua as kq on sv.masv=kq.masv) join monhoc as mh on kq.mamh=mh.mamh
	where tenmh in (N'Lý thuyết cơ sở dữ liệu',N'Tin học đại cương',N'Mạng máy tính')
	-- khi một bản ghi sinhvien đã được ghi nhận thi 1 trong 3 môn thì nếu nhận một bản ghi khác tương tự sẽ bị bỏ qua vì chỉ select masv,tensv
	select sv.masv,tensv
	from (sinhvien as sv join ketqua as kq on sv.masv=kq.masv) join monhoc as mh on kq.mamh=mh.mamh
	where tenmh like (N'Lý thuyết cơ sở dữ liệu')
	union
	select sv.masv,tensv
	from (sinhvien as sv join ketqua as kq on sv.masv=kq.masv) join monhoc as mh on kq.mamh=mh.mamh
	where tenmh like (N'Mạng máy tính')
	union
	select sv.masv,tensv
	from (sinhvien as sv join ketqua as kq on sv.masv=kq.masv) join monhoc as mh on kq.mamh=mh.mamh
	where tenmh like (N'Tin học đại cương')

 -- 4.Cho biết mã môn học, tên môn mà sinh viên có mã số 1 chưa có điểm
 select mh.mamh,tenmh
 from monhoc as mh
except 
 select mh.mamh,tenmh
 from sinhvien as sv,ketqua as kq, monhoc as mh
 where sv.masv = kq.masv and kq.mamh=mh.mamh and sv.masv='1' 

 select mh.mamh,tenmh
 from monhoc as mh
 where mh.mamh not in (select mh.mamh
 from sinhvien as sv,ketqua as kq, monhoc as mh
 where sv.masv = kq.masv and kq.mamh=mh.mamh and sv.masv='1')
 --5.Cho biết điểm cao nhất môn 1 mà các sinh viên đạt được
 select max(diem) as [Max score]
 from ketqua as kq
 where mamh='1'
 --6.Cho biết mã sinh viên, tên những sinh viên có điểm thi môn 2 không thấp nhất khoa
 select sv.masv,tensv
 from sinhvien as sv,ketqua as kq
 where sv.masv = kq.masv 
       and diem >  (select min(diem) from ketqua where mamh=2)
       and mamh=2 
 --7.Cho biết mã sinh viên và tên những sinh viên có điểm thi môn 1 lớn hơn điểm thi môn 1 của sinh viên có mã số 3
 select sv.masv,tensv
 from ketqua as kq, sinhvien as sv
 where sv.masv=kq.masv
 and  mamh='1' 
 and diem >(select diem from ketqua where masv='3' and mamh='1')
 
 select *
 from ketqua 
 where mamh='1'
 --8.Cho biết số sinh viên phải thi lại môn Toán Cao cấp
 select count(masv)
 from ketqua as kq, monhoc as mh
 where kq.mamh=mh.mamh 
       and diem < 5 
       and tenmh=N'Toán Cao Cấp'

 select masv,diem
 from ketqua,monhoc
 where ketqua.mamh= monhoc.mamh and tenmh = N'Toán Cao Cấp'
 --9.Đối với mỗi môn, cho biết tên môn và số sinh viên phải thi lại môn đó mà số sinh viên thi lại >=2
 select tenmh,count(kq.masv)
 from ketqua as kq, monhoc as mh
 where diem < 5 and kq.mamh=mh.mamh
 group by tenmh
 having count(kq.masv) >= 2

--10.Cho biết mã sinh viên, tên và lớp của sinh viên đạt điểm cao nhất môn Tin đại cương
select sv.masv,tensv,lop
from sinhvien as sv, ketqua as kq, monhoc as mh
where sv.masv = kq.masv and kq.mamh=mh.mamh and tenmh=N'Tin đại cương'
and diem =
(select max(diem) 
from ketqua as kq,monhoc as mh
where kq.mamh=mh.mamh and tenmh like N'Tin đại cương')

select * 
from monhoc
where mamh='3'

delete from monhoc
where mamh='4'
--11.Cho biết mã số và tên của những sinh viên tham gia thi tất cả các môn. (Giả sử cần thi tất cả các môn có trong bảng Môn học)

select sv.masv,tensv
from ketqua as kq join sinhvien as sv on kq.masv=sv.masv
group by sv.masv,tensv
having count(mamh)=
(select count(mamh)
from monhoc)

sp_help  monhoc
insert into ketqua
values ('15','5','8')

delete from ketqua
where masv=15 and mamh=5

--12. Cho biết mã sinh viên và tên của sinh viên có điểm trung bình chung học tập >=6
 select sv.masv,tensv
 from sinhvien sv
 join
 (select kq.masv,sum(diem * dvht) as tongdiem, sum(dvht) as tongdv
 from ketqua kq join monhoc mh on kq.mamh=mh.mamh
 group by kq.masv
 having  SUM(diem * dvht) / sum(dvht) >= 6) res on res.masv=sv.masv

 

 select * from ketqua join monhoc on ketqua.mamh=monhoc.mamh
 --13. Cho danh sách tên và mã sinh viên có điểm trung bình chung lớn hơn điểm trung bình của toàn khóa.
select kq.masv,sum(diem * dvht) / sum(dvht) 
 from ketqua kq join monhoc mh on kq.mamh=mh.mamh
 group by kq.masv
 having sum(diem * dvht) / sum(dvht) >
 (select sum(diem * dvht) / sum(dvht) 
 from ketqua kq join monhoc mh on kq.mamh=mh.mamh)

 --14.*Cho biết mã sinh viên và tên những sinh viên phải thi lại ở ít nhất là những môn mà sinh viên có mã số 3 phải thi lại
 use QLSV
 --15. *Cho mã sinh viên và tên của những sinh viên có hơn nửa số điểm >=5.
 use QLSV
 select m.masv,tensv
 from
  (select sv.masv,tensv,count(mamh) as diem
  from ketqua kq join sinhvien sv on kq.masv=sv.masv
  where diem >= 5
  group by sv.masv,tensv )as m
  join
  (select masv,count(mamh)/2 as mh
  from ketqua
  group by masv) as n 
  on m.masv=n.masv
  where m.diem > n.mh
  --16. *Cho danh sách mã sinh viên, tên sinh viên có điểm môn Tin đại cương cao nhất của mỗi lớp.
    select *

	from sinhvien as sv
	join
	ketqua as kq on sv.masv=kq.masv
	join
	monhoc as mh on kq.mamh=mh.mamh
	join
	(select lop,max(diem) as maxs
	from ketqua as kq, monhoc as mh,sinhvien as sv
	where sv.masv=kq.masv and mh.mamh=kq.mamh and tenmh=N'Tin đại cương'
	group by lop) as lop1 on sv.lop=lop1.lop 

	where  tenmh like N'%Tin đại cương' and kq.diem = lop1.maxs 
--17. *Cho danh sách tên và mã sinh viên có điểm trung bình chung lớn hơn điểm trung bình của lớp sinh viên đó theo học
select *
from sinhvien as sv
join
 (select kq.masv,sum(diem * dvht) /sum(dvht) as m 
 from ketqua kq join monhoc mh on kq.mamh=mh.mamh
 group by kq.masv) as temp1 on sv.masv=temp1.masv
 join
(select lop,sum(diem * dvht) /sum(dvht)  as n
 from sinhvien as sv join ketqua as kq on sv.masv=kq.masv join monhoc mh on kq.mamh=mh.mamh
 group by lop) as temp2 on sv.lop=temp2.lop
 where temp1.m > temp2.n


select * from sinhvien
select * from ketqua
select * from monhoc

create view