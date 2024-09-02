
-- Trả về giá trị, bảng
-- phải gọi dbo.FunctionName()
-- trả về 1 giá trị thì dùng được trong select, trả về một bảng(trả về return) thì dùng được trong from

Create Function Thu(@ngay Datetime)
returns Nvarchar(10)
as
Begin
declare @st Nvarchar(10)
Select @st=case Datepart(dw,@ngay)
when 1 then N'Chủ Nhật'
when 2 then N'Thứ Hai'
when 3 then N'Thứ Ba'
when 4 then N'Thứ Tư'
when 5 then N'Thứ Năm'
when 6 then N'Thứ Sáu'
when 7 then N'Thứ Bảy'
end
return (@st) --Trả về giá trị cho hàm
end

alter Function tao_bang_TK (@MMH int)
Returns @Bang_TK Table (Lop nvarchar(10),SL int) -- khai báo trả về bảng Bang_TK có 2 cột
As
Begin
Insert into @Bang_TK
select Lop, count(a.Masv) as SL
from (sinhvien a join ketqua b on a.masv=b.masv) join monhoc c on b.mamh=c.mamh
where b.mamh=@mmh
group by Lop
return
end
use QLSV
--Thực thi lời gọi hàm
select * from dbo.Tao_bang_TK(1)

-- Viết hàm đưa ra ngày hiện tại

create function ngay (@ngay date)
returns int
as
begin
 return datepart(d,@ngay)
 end
 declare @b date = getdate()
 dbo.ngay(@b)

 --Viết một hàm đưa ra quý sinh. Áp dụng để đưa ra danh dách các bạn sinhvien sinh quý 2
 create function quy (@ngay date)
 returns int
 as begin
  return datepart(q,@ngay)
  end

print str(dbo.quy('2022-2-20'))

 select *
 from sinhvien
 where dbo.quy(ngaysinh) = '2'

 -- 3.Viết hàm chỉ ra năm nhuận hay không nhuận của một năm nhập vào
 create function nam (@nam int)
 returns nvarchar(50)
 as begin
  declare @res nvarchar(50)
  if(( @nam%4=0 and @nam%100<>0 )or (@nam % 400=0))
  set @res = N'Năm nhuận'
   else
  set @res = N'Không là năm nhuận'
   return @res
   end

   print dbo.nam(2021)

--4.Hàm đưa ra các sinh viên có năm sinh bằng năm nhập vào
alter function namsinh2 (@nam int)
 returns table
 as
  return (
  select * from sinhvien where datepart(yy,ngaysinh)=@nam )
 

 select masv,tensv from namsinh2(1996)

 --5.Viết hàm kiểm tra năm sinh 2 sinh viên

  create function kiemtra3 (@ma varchar(50), @ma2 varchar(50))
  returns nvarchar(50)
 as
 begin
   declare @y1 int , @y2 int, @res nvarchar(50)
  select @y1 = datepart(yy,ngaysinh)
  from sinhvien where masv=@ma 
   select @y2 = datepart(yy,ngaysinh) 
  from sinhvien where masv=@ma2
  if(@y1<> @y2)
   set @res = N'2 sinh viên không cùng năm sinh'
	else
	set @res = N'2 sinh viên cùng năm sinh'
	return @res
	end
	select*from sinhvien
  print dbo.kiemtra3(1,4)

  --6.Kiểm tra sinh viên sinh trước

 create function kiemtra4 (@ma varchar(50), @ma2 varchar(50))
 returns nvarchar(50)
 as
 begin
   declare @y1 date , @y2 date,@res nvarchar(50)
  select @y1 = ngaysinh
  from sinhvien where masv=@ma 
   select @y2 = ngaysinh
  from sinhvien where masv=@ma2
  if(@y1 < @y2)
    set @res =  (N'Sinh viên ' + @ma +N' sinh trước sinh vien ' + @ma2)
	else
	set @res = (N'Sinh viên ' + @ma2 +N' sinh trước sinh vien ' + @ma)
	return @res
	end
	select*from sinhvien
	
 print dbo.kiemtra4(1,4)

 --Viết một hàm đưa ra tháng sinh. Áp dụng để đưa ra tháng sinh các bạn sinh viên đã thi môn có mã là 1.
  create function thangsinh (@ngay date)
   returns int
   as
   begin
   return ( datepart(mm,@ngay))
   end
  
   select sv.masv,tensv,dbo.thangsinh(ngaysinh) as thangsinh
   from sinhvien as sv join ketqua as kq on sv.masv=kq.masv
   where  mamh=1
   --Tính tổng tiền đã mua hàng của một khách hàng nào đó theo mã KH
   use Hanghoa
   create function tong (@makh nvarchar(50))
   returns int
   as
   begin
   return ( 
   select sum(soluongmua*dongia)
   from CT_HOADON as ct join HOADONXUAT as hd on ct.mahd=hd.mahd
   where makh=@makh)
   end

   select dbo.tong(12642)

   --Cho biết tổng số tiền hàng đã mua của một hóa đơn nào đó 
   create function tong2 (@mahd nvarchar(50))
   returns int
   as
   begin
   return ( 
   select sum(soluongmua*dongia)
   from CT_HOADON 
   where mahd=@mahd)
   end
   select dbo.tong2(325782336)
--Cho biết tổng số tiền hàng đã bán của một tháng nào đó
select*from HOADONXUAT
create function tk_thang(@thang int)
returns int
as
begin
 return (
   select sum(soluongmua*dongia)  from hoadonxuat as hd join CT_HOADON as ct on ct.mahd=hd.mahd
   where datepart(mm,ngaylaphd)=@thang )
   end

 select dbo.tk_thang(5)

 --Cho biết họ tên của nhân viên có tuổi cao nhất
  create function maxage ()
  returns nvarchar(50)
  as
  begin
  declare @res nvarchar(50)
  select top 1 @res=hoten 
  from nhanvien
  order by (year(getdate()) - year(ngaysinh)) desc
  return @res
  end
 print dbo.maxage()