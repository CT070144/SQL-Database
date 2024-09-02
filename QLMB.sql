create database QLMB

use QLMB

create table Chuyenbay(
 MaCB char(5) primary key,
 GaDi nvarchar(50) not null,
 GaDen nvarchar(50)not null,
 DoDai int not null,
 GioDi time not null,
 GioDen time not null,
 ChiPhi int not null)

 create table maybay(
 MaMB int primary key,
 Hieu nvarchar(50) not null,
 TamBay int not null,)
 
 create table nhanvien(
 maNV char(9) primary key,
 ten   nvarchar(50) not null,
 Luong int not null)

 create table chungnhan(
  maNV char(9) foreign key references nhanvien(maNV),
  maMB int foreign key references maybay(maMB))
    drop table chuyenbay,maybay
    drop table chuyenbay,maybay
  drop table chuyenbay,maybay
  use QLMB
  sp_help
  insert into Chuyenbay
  values ('VN431',N'SGN',N'CAH','3693','05:55','06:55','236'),
('VN320',N'SGN',N'DAD','2798','06:00','07:10','221'),
('VN464',N'SGN',N'DLI','2002','07:20','08:05','225'),
('VN216',N'SGN',N'DIN','4170','10:30','14:20','262'),
('VN280',N'SGN',N'HPH','11979','06:00','08:00','1279'),
('VN254',N'SGN',N'HUI','8765','18:40','20:00','781'),
('VN338',N'SGN',N'BMV','4081','15:25','16:25','375'),
('VN440',N'SGN',N'BMV','4081','18:30','19:30','426'),
('VN651',N'DAD',N'SGN','2798','19:30','08:00','221'),
('VN276',N'DAD',N'CXR','1283','09:00','12:00','203'),
('VN374',N'HAN',N'VII','510','11:40','13:25','120'),
('VN375',N'VII',N'CXR','752','14:15','16:00','181'),
('VN269',N'HAN',N'CXR','1262','14:10','15:50','202'),
('VN315',N'HAN',N'DAD','134','11:45','13:00','112'),
('VN317',N'HAN',N'UIH','827','15:00','16:15','190'),
('VN741',N'HAN',N'PXU','395','06:30','08:30','120'),
('VN474',N'PXU',N'PQC','1586','08:40','11:20','102'),
('VN476',N'UIH',N'PQC','485','09:15','11:50','117')

select*from Chuyenbay
select*from maybay
use QLMB
insert into Maybay
values('747',N'Boeing 747-400','13488'),
('737',N'Boeing 737-800','5413'),
('340',N'Airbus A340-300','11392'),
('757',N'Boeing 757-300','6416'),
('777',N'Boeing 777-300','10306'),
('767',N'Boeing 767-400ER','10360'),
('320',N'Airbus A320','4168'),
('319',N'Airbus A319','2888'),
('727',N'Boeing 727','2406'),
('154',N'Tupolev 154','6565')

insert into nhanvien
values ('242518965',N'Tran Van Son','120433'),
('141582651',N'Doan Thi Mai','178345'),
('011564812',N'Ton Van Quy','153972'),
('567354612',N'Quan Cam Ly','256481'),
('552455318',N'La Que','101745'),
('550156548',N'Nguyen Thi Cam','205187'),
('390487451',N'Le Van Luat','212156'),
('274878974',N'Mai Quoc Minh','99890'),
('254099823',N'Nguyen Thi Quynh','24450'),
('356187925',N'Nguyen Vinh Bao','44740'),
('355548984',N'Tran Thi Hoai An','212156'),
('310454876',N'Ta Van Do','212156'),
('489456522',N'Nguyen Thi Quy Linh','127984'),
('489221823',N'Bui Quoc Chinh','23980'),
('548977562',N'Le Van Quy','84476'),
('310454877',N'Tran Van Hao','33546'),
('142519864',N'Nguyen Thi Xuan Dao','227489'),
('269734834',N'Truong Tuan Anh','289950'),
('287321212',N'Duong Van Minh','48090'),
('552455348',N'Bui Thi Dung','92013'),
('248965255',N'Tran Thi Ba','43723'),
('159542516',N'Le Van Ky','48250'),
('348121549',N'Nguyen Van Thanh','32899'),
('574489457',N'Bui Van Lap','20')

insert into CHUNGNHAN
values ('567354612','747'),
('142519864','340'),
('567354612','737'),
('142519864','320'),
('567354612','757'),
('269734834','747'),
('567354612','777'),
('269734834','737'),
('567354612','767'),
('269734834','340'),
('567354612','727'),
('269734834','757'),
('567354612','340'),
('269734834','777'),
('552455318','737'),
('269734834','767'),
('552455318','319'),
('269734834','320'),
('552455318','747'),
('269734834','319'),
('552455318','767'),
('269734834','727'),
('390487451','340'),
('269734834','154'),
('390487451','320'),
('242518965','737'),
('390487451','319'),
('242518965','757'),
('274878974','757'),
('141582651','737'),
('274878974','767'),
('141582651','757'),
('355548984','154'),
('141582651','767'),
('310454876','154'),
('011564812','737'),
('142519864','747'),
('011564812','757'),
('142519864','757'),
('574489457','154'),
('142519864','777'),
('142519864','767'),
('142519864','737')
select*from chuyenbay
select*from maybay
select * from nhanvien where ten like 'Nguyen %'
select*from chungnhan 
where manv in (select manv from nhanvien where ten like 'Nguyen %')
use QLMB
--1.Cho biết thông tin về các nhân viên có lương nhỏ hơn 10000
select *
from nhanvien
where luong < 10000
--2.Cho biết thông tin về các chuyến bay có độ dài đường bay nhỏ hơn 10000km và lớn hơn 8000km
select *
from chuyenbay
where dodai < 10000 or dodai > 8000
--3.Cho biết thông tin về các chuyến bay xuất phát từ Sài Gòn (SGN) đi Ban Mê Thuột (BMV)
select *
from chuyenbay
where gadi like 'SGN' and gaden like 'BMV'
--4. Có bao nhiêu chuyến bay xuất phát từ Sài Gòn (SGN)
select count(macb)
from chuyenbay
where gadi like 'SGN'
--5. Có bao nhiêu loại máy bay Boeing
select count(mamb)
from maybay
where hieu like 'Boeing%'
--6. Cho biết tổng số lương phải trả cho các nhân viên
select sum(luong)
from nhanvien
--7. Cho biết mã số và tên của các phi công lái máy bay Boeing
select distinct nv.manv,ten
from maybay as mb, chungnhan as cer, nhanvien as nv
where mb.mamb=cer.mamb and nv.manv = cer.manv and hieu like '%Boeing%'

--8. Cho biết mã số và tên của các phi công có thể lái được máy bay có mã số là 747
select nv.manv,ten
from chungnhan as cer join nhanvien as nv on cer.manv=nv.manv
where mamb='747'
--9. Cho biết mã số của các loại máy bay mà nhân viên có họ Nguyễn có thể lái
select mamb,ten
from   nhanvien as nv left join chungnhan as cer  on cer.manv=nv.manv 
where ten like N'Nguyen %'

--10. Cho biết mã số của các phi công vừa lái được Boeing vừa lại được Airbus A320
use QLMB
select manv
from chungnhan as cer join maybay as mb on mb.mamb=cer.mamb
where hieu like '%Boeing%'
intersect
select manv
from chungnhan as cer join maybay as mb on mb.mamb=cer.mamb
where hieu like '%Airbus A320%'
--11. Cho biết các loại máy bay có thể thực hiện được chuyến bat VN280
select hieu,tambay
from maybay
where tambay >
(select dodai
from chuyenbay
where macb like 'VN280')
--12. Cho biết các chuyến bay có thể thực hiện bởi máy bay Airbus A320
select macb,dodai
from chuyenbay
where dodai <
(select tambay
from maybay
where hieu like '%Airbus A320')
--13. Với mỗi loại máy bay có phi công lái, cho biết mã số, loại máy bay và tổng số phi công có thể lái loại máy bay đó
select mb.mamb, hieu, count(manv) as [Tổng phi công]
from  chungnhan cer left join maybay mb on cer.mamb=mb.mamb
group by mb.mamb,hieu

select manv,mb.mamb, hieu
from  chungnhan cer left join maybay mb on cer.mamb=mb.mamb
--14. Giả sử một hành khách muốn đi thẳng từ ga A đến ga B rồi quay trở về ga A. Cho biết các đường bay nào có thể đáp ứng yêu cầu này.
 select *
 from 
  (select macb,gadi,gaden,gioden
  from chuyenbay) as b1,
  (select macb,gadi,gaden,giodi
  from chuyenbay ) as b2
  where b1.gadi=b2.gaden and b2.gadi=b1.gaden and gioden < giodi

--15. Với mỗi ga có chuyến bay xuất phát từ đó, cho biết có bao nhiêu chuyến bay khởi hành từ ga đó và cho biết tổng chi phí phải trả chi phi công lái các chuyến bay khởi hành từ ga đó.
select gadi,count(macb) as [Số chuyến],sum(chiphi) as [Tổng chi phí]
from chuyenbay 
group by gadi

--16. Với mỗi ga xuất phát, cho biết có bao nhiêu chuyến bay có thể khởi hành trước 12:00
select gadi,count(macb)
from chuyenbay
where giodi < '12:00'
group by gadi
--17. Với mỗi phi công có thể lái nhiều hơn 3 loại máy bay, cho biết mã số phi công và tầm bay lớn nhất của các loại máy bay mà phi công đó có thể lái
select manv,count(cer.mamb),max(tambay)
from chungnhan as cer join maybay as mb on cer.mamb=mb.mamb
group by manv
having count(cer.mamb)>3

--18. Cho biết mã số của các phi công có thể lái được nhiều loại máy bay nhất

select top 1 manv,count(mamb)
from chungnhan
group by manv
order by count(mamb) desc
--19. Cho biết mã số của các phi công có thể lái được ít loại máy bay nhất
select top 1 manv,count(mamb)
from chungnhan
group by manv
order by count(mamb) asc
--20. Tìm các chuyến bay có thể được thực hiện bởi tất cả các loại máy bay Boeing
select *
from chuyenbay 
where dodai <
(select min(tambay)
from maybay
where hieu like 'Boeing%')
--21. Tìm các chuyến bay có thể được lái bởi các phi công có lương lớn hơn 100.000
select * 
from chuyenbay as cb
 where dodai <(
select top 1 max(tambay) as maxn
from  nhanvien as nv join chungnhan as cer on nv.manv=cer.manv
 join maybay as mb on cer.mamb=mb.mamb
where luong > 100000
group by cer.manv
order by max(tambay) desc)


--22. Cho biết tên các phi công có lương nhỏ hơn chi phí thấp nhất của đường bay từ Sài Gòn (SGN) đến Buôn mê Thuột (BMV)
select distinct ten,luong
from  nhanvien as nv left join chungnhan as cer on cer.manv=nv.manv
where luong <
 (select min(chiphi)
 from chuyenbay
 where gadi like 'SGN' and gaden like 'BMV')

-- 23. Cho biết mã số của các phi công có lương cao nhất
 select distinct top 1 nv.manv, luong
 from nhanvien as nv left join chungnhan as cer on cer.manv=nv.manv
 order by luong desc
 

 --24. Cho biết mã số của các nhân viên có lương cao thứ nhì
 select manv
 from nhanvien 
 where luong =
 (select top 1 luong
 from nhanvien
 where luong <
 (select max(luong)
 from nhanvien)
 order by luong desc)
 --25. Cho biết tên và lương của các nhân viên không phải là phi công và có lương lớn hơn lương trung bình của tất cả các phi công.
 select manv,ten,luong
 from
  (select manv,ten,luong
  from nhanvien
  except 
  select distinct nv.manv,ten,luong from nhanvien as nv join chungnhan as cer on nv.manv=cer.manv) as res1
  where luong >
 (select avg(luong)
 from (select distinct nv.manv,luong from nhanvien as nv join chungnhan as cer on nv.manv=cer.manv) as res)

--26. Cho biết tên các phi công có thể lái các máy bay có tầm bay lớn hơn 4.800km nhưng không có chứng nhận lái máy bay Boeing
   select distinct nv.manv
   from nhanvien as nv join chungnhan as cer on nv.manv=cer.manv join maybay as mb on mb.mamb=cer.mamb
   where tambay > 4800
   except
    select nv.manv,ten,hieu
   from nhanvien as nv join chungnhan as cer on nv.manv=cer.manv join maybay as mb on mb.mamb=cer.mamb
   where mb.hieu not like '%Boeing%'

--27. Cho biết tên các phi công lái ít nhất 3 loại máy bay có tầm xa hơn 3200km
 select nv.manv,ten,count(cer.mamb) as [Số lượng]
 from nhanvien as nv join chungnhan as cer on nv.manv=cer.manv join maybay as mb on mb.mamb=cer.mamb
 where tambay > 3200
 group by nv.manv,ten
 having count(cer.mamb) >=3
 --28. Với mỗi nhân viên, cho biết mã số, tên nhân viên và tổng số loại máy bay Boeing mà nhân viên đó có thể lái
 select nv.manv,ten,count(cer.mamb)
 from nhanvien as nv join chungnhan as cer on nv.manv=cer.manv join maybay as mb on mb.mamb=cer.mamb
 where hieu like 'Boeing%'
 group by nv.manv,ten
 
 --29. Với mỗi loại máy bay, cho biết loại máy bay và tổng số phi công có thể lái loại máy bay đó
 select mamb,count(manv)
 from chungnhan
 group by mamb
 select*from maybay
 --30. Với mỗi chuyến bay, cho biết mã số chuyến bay và tổng số phi công không thể lái chuyến đó.

 --31. Với mỗi loại máy bay, cho biết loại máy bay và tổng số chuyến bay không thể thực hiện bởi loại máy bay đó
  select mamb,count(macb)
  from maybay as mb,chuyenbay as cb 
  where mb.tambay < cb.dodai
  group by mamb
 --32. Với mỗi chuyến bay, hãy cho biết mã số chuyến bay và tổng số loại máy bay có thể thực hiện chuyến bay đó
   select macb,count(mamb)
  from maybay as mb,chuyenbay as cb 
  where mb.tambay > cb.dodai
  group by macb
--33. Với mỗi loại máy bay, hãy cho biết loại máy bay và tổng số phi công có lương lớn hơn 100.000 có thể lái loại máy bay đó.
 select hieu,count(nv.manv)
 from maybay as mb join chungnhan as cer on mb.mamb=cer.mamb
      join nhanvien as nv on nv.manv=cer.manv
 where luong > 100000 
group by hieu

--34. Với mỗi loại máy bay có tầm bay trên 3200km, cho biết tên của loại máy bay và lương trung bình của các phi công có thể lái loại máy bay đó
use qlmb
select mb.mamb,hieu,avg(luong)
from maybay as mb join chungnhan as cer on mb.mamb=cer.mamb
      join nhanvien as nv on nv.manv=cer.manv
where tambay > 3200
group by mb.mamb,hieu
--35. Với mỗi phi công, cho biết mã số, tên phi công và tổng số chuyến bay xuất phát từ Sài Gòn mà phi công đó có thể lái
   select nv.manv,ten,count(cb.macb)
   from chungnhan as cer
   join nhanvien as nv on nv.manv=cer.manv
   join maybay as mb on cer.mamb=mb.mamb
   join
(  select macb,dodai from chuyenbay
   where gadi = 'SGN') as cb on tambay > dodai
   group by nv.manv,ten
   
   

--36. Một hành khách muốn đi từ Hà Nội (HAN) đến nha trang (CXR) mà không phải đổi chuyến bay quá một lần. Cho biết mã chuyếnbay, thời gian khời hành từ Hà nội nếu hành khách muốn đến Nha Trang trước 16:00



 --37. Cho biết thông tin của các đường bay mà tất cả các phi công có thể bay trên đường bay đó đều có lương lớn hơn 100000
    create view pc as
	select distinct nv.manv
	from nhanvien as nv join chungnhan as cer on nv.manv=cer.manv
	where luong > 100000
	select macb

	--Tính số lượng phi công có thể lái trên mỗi đường bay
	create view v1 as
    select macb,manv
	from chungnhan as cer 
	join maybay as mb on mb.mamb=cer.mamb
	join chuyenbay as cb on mb.tambay > cb.dodai
	join nhanvien as nv on nv.manv = nv.manv
	group by macb
	--Tính số lượng phi công lương <100000 có thể lái trên mỗi đường bay
    create view v2 as
     select macb
	 from v1 left join nhanvien as nv =manv
	 where luong < 100000
	--Tổng hợp
	select v1.macb
	from v1 join v2 on v1.macb=v2.macb
	where v1.sl=v2.sl

	
	

--38. Cho biết tên các phi công chỉ lái các loại máy bay có tầm xa hơn 3200km và một trong số đó là Boeing



--39. Tìm các phi công có thể lái tất cả các loại máy bay Boeing.
 select nv.manv,ten
 from nhanvien as nv join chungnhan as cer on nv.manv=cer.manv
       join maybay as mb on cer.mamb=mb.mamb
 where hieu like 'Boeing%'
 group by nv.manv,ten
 having count(mb.mamb)=
 (select count(mamb)
 from maybay
 where hieu like 'Boeing%')

 




















































  

