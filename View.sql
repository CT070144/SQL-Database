use QLSV
select*from sinhvien
select*from ketqua
select*from monhoc
--1. Lấy ra danh sách sinh viên nữ học môn Lý thuyết cơ sở dữ liệu và điểm thi tương ứng.
create view SV_Nu as
select tensv,diem
from sinhvien as sv,ketqua as kq,monhoc as mh
where sv.masv=kq.masv and kq.mamh=mh.mamh and tenmh like N'Toán cao cấp' and gioitinh like N'Nữ'

alter view SV_Nu
as
select masv,tensv
from sinhvien
where gioitinh like N'Nữ'
except 
select distinct sv.masv,tensv
from sinhvien as sv join ketqua as kq on sv.masv=kq.masv
where gioitinh like N'Nữ'

select*from SV_Nu
drop view SV_Nu
--2. Cho biết số sinh viên thi đỗ môn toán cao cấp
create view toancaocap(Soluong)
as
select count(masv)
from ketqua as kq join monhoc as mh on kq.mamh=mh.mamh
where tenmh like N'Toán cao cấp' and diem >= 5

select * from toancaocap

create view v2 as 
select masv
from sinhvien
except 
select distinct masv
from ketqua
select count(masv) from v2

--3. Lấy ra tên sinh viên và điểm trung bình của các sinh viên theo từng lớp
create view avg_sv(Tên,Lớp,[Điểm trung bình]) as
select tensv,lop,sum(diem*dvht)/sum(dvht) as dtb
from  sinhvien as sv
 join ketqua as kq on sv.masv=kq.masv
 join monhoc as mh on kq.mamh=mh.mamh
group by tensv,lop

select * from avg_sv

--4. Cho biết số sinh viên thi lại của từng môn
create view thilai(Tên, Soluong) as 
 select tenmh,count(masv)
 from ketqua as kq join monhoc as mh on kq.mamh=mh.mamh
 where diem < 5
 group by tenmh

 select * from thilai
 --5. *. Cho biết mã số và tên môn của những môn học mà tất cả các sinh viên đều đạt điểm >=5
 create view v51(mamh,tenmh,sl) as
  select kq.mamh,tenmh,count(masv) as b1
  from ketqua as kq join monhoc as mh on kq.mamh=mh.mamh
  where diem >=5
  group by kq.mamh,tenmh

 create view v52(mamh,tenmh,sl) as
  select kq.mamh,tenmh,count(masv) as b2
  from ketqua as kq join monhoc as mh on kq.mamh=mh.mamh
  group by kq.mamh,tenmh

  drop view v51,v52
  select * from v52
--Truy vấn 
  select v51.mamh,v51.tenmh 
  from v51,v52
  where v51.mamh=v52.mamh and v51.sl=v52.sl
  --6. *. Cho biết mã số và tên những sinh viên có điểm trung bình chung học tập cao hơn điểm trung bình chung của mỗi lớp.
   create view v61(lop,dtb) as
   select lop,sum(diem*dvht)/sum(dvht)
   from ketqua as kq join sinhvien as sv on sv.masv=kq.masv
   join monhoc as mh on mh.mamh=kq.mamh
   group by lop
create view v62(masv,tensv,lop,dtb) as
 select sv.masv,tensv,lop,sum(diem*dvht)/sum(dvht) as dtb
 from  sinhvien as sv
 join ketqua as kq on sv.masv=kq.masv
 join monhoc as mh on kq.mamh=mh.mamh
 group by sv.masv,tensv,lop
 drop view v62
 select * from v62
 select * from v61
    select masv,tensv,v62.lop,v62.dtb
	from v62 left join v61 on v62.lop=v61.lop
	where v61.dtb < v62.dtb
  --7. Cho biết mã số và tên nhưng sinh viên có hơn một nửa số điểm >=5
   create view v7 as
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
  --8.Cho biết mã số và số điểm lớn hơn 7 của những sinh viên có hơn một nửa số điểm là >=7
  --Tạo view cho những sinh viên có một nửa số điểm là >=7
     create view v81 as
   select m.masv
 from
  (select sv.masv,tensv,count(mamh) as diem
  from ketqua kq join sinhvien sv on kq.masv=sv.masv
  where diem >= 7
  group by sv.masv,tensv )as m
  join
  (select masv,count(mamh)/2 as mh
  from ketqua
  group by masv) as n 
  on m.masv=n.masv
  where m.diem > n.mh
  -- Truy vấn
    select v81.masv,count(diem)
	from v81 join ketqua as kq on kq.masv=v81.masv
	where diem > 7
	group by v81.masv

select * from ketqua