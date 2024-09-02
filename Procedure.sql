use qlsv

declare @a nvarchar(50)
set @a = (select tensv from sinhvien where masv=1)

print @a

declare @b int = 0
while @b < 5
begin 
 print N'xin chào'
 set @b=@b+1
end
print N'end'
select*from sinhvien
alter proc LOP (@lop nvarchar(30),@que nvarchar(20)) as
begin
  select*from sinhvien where lop=@lop and que=@que
end

LOP N'L01',N'Hà Nội'
sp_help

--1.Viết một thủ tục đưa ra các sinh viên có năm sinh bằng với năm sinh nhập vào
create proc namsinh(@nam int)
as
begin

 select * from sinhvien
 where datepart(yy,ngaysinh) = @nam
 end
 use QLSV
 namsinh '1997'

--2.Viết thủ tục xóa dữ liệu sinh viên theo mã sinh viên
Lê Thùy Dương	Nữ	1997-05-12	Hà Nội	L02
select*from monhoc
insert into monhoc
values (N'Toán rời rạc','4')
alter proc xoa (@ma nvarchar(50)) 
as
begin
  delete from monhoc
  where mamh=@ma
end 
select*from sinhvien
xoa N'6'

--3.Viết thủ tục sửa tên lớp của sinh viên theo masv
create proc sua (@ma nvarchar(50),@lop nvarchar(10))
as
begin
 update sinhvien
 set lop = @lop
 where masv=@ma
end 

sua '1','L02'
--4.Viết thủ tục kiểm tra 2 sinh viên có cùng năm sinh hay không

 create proc kiemtra (@ma varchar(50), @ma2 varchar(50))
 as
 begin
   declare @y1 int , @y2 int
  select @y1 = datepart(yy,ngaysinh)
  from sinhvien where masv=@ma 
   select @y2 = datepart(yy,ngaysinh) 
  from sinhvien where masv=@ma2
  if(@y1<> @y2)
    print N'2 sinh viên không cùng năm sinh'
	else
	print N'2 sinh viên cùng năm sinh'
	end

	select*from sinhvien

	kiemtra '3','5'
--5.Kiểm tra sinh viên nào được sinh trước

alter proc kiemtra2 (@ma varchar(50), @ma2 varchar(50))
 as
 begin
   declare @y1 date , @y2 date
  select @y1 = ngaysinh
  from sinhvien where masv=@ma 
   select @y2 = ngaysinh
  from sinhvien where masv=@ma2
  if(@y1 < @y2)
    print N'Sinh viên ' + @ma +N' sinh trước sinh vien ' + @ma2
	else
	print N'Sinh viên ' + @ma2 +N' sinh trước sinh vien ' + @ma
	end
	select*from sinhvien
kiemtra2 '1','5'
--18. Đối với mỗi lớp, lập bảng điểm gồm mã sinh viên, tên sinh viên và điểm trung bình chung học tập
create proc loclop(@lop nvarchar(10))
as begin
select sv.masv ,tensv,sum(diem*dvht)/sum(dvht) as DTB
from sinhvien as sv join ketqua as kq on kq.masv=sv.masv
join monhoc as mh on mh.mamh=kq.mamh
where lop = @lop
group by sv.masv,tensv
end
select*from sinhvien where lop='L03'
loclop 'L03'
--19. Đối với mỗi lớp, cho biết mã sinh viên và tên những sinh viên phải thi lại từ 2 môn trở lên
create proc loclop2(@lop nvarchar(10))
as begin
select sv.masv ,tensv
from sinhvien as sv join ketqua as kq on kq.masv=sv.masv
join monhoc as mh on mh.mamh=kq.mamh
where diem < 5 and lop = @lop
group by sv.masv,tensv
having count(mh.mamh) >=2 
end

select * from sinhvien as sv join ketqua as kq on kq.masv=sv.masv
where diem < 5

loclop2 'L03'