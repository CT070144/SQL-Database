use northwnd
create trigger trigger_name
on products
--for{insert|update|delete}
after insert
as
begin
 update products
 set productname=upper(i.productname)
 from inserted i
 where products.productid=i.productid
end
insert into products(productname,supplierid,categoryid)
values ('testname',2,3)
select*from products

create TRIGGER PreventNegativeDiscountinued
 ON [dbo].[Products]
 FOR UPDATE
AS
BEGIN
 set nocount on;
IF EXISTS (SELECT 1 FROM inserted WHERE [Discontinued] !=0 and [Discontinued] != 1)
  BEGIN
ROLLBACK;
RAISERROR('[Discontinued] không thể nhỏ hơn 0', 16, 1);
  END
END 
drop trigger PreventNegativeDiscountinued


UPDATE products
SET Discontinued = -5
where productid=78
select*from products


create trigger modifystock 
on [dbo].[Order Details]
after insert
as
begin 
 update [dbo].[Products] 
set [UnitsInStock]=[UnitsInStock] - (select [Quantity] from inserted where [dbo].[Products].[ProductID] = inserted.ProductID)
where [dbo].[Products].[ProductID] in (select productid from inserted)
end
drop trigger modifystock
 
 INSERT INTO [dbo].[Order Details] 
 values ('10252',42,1,4,0);
select*from products where productid=42

delete from [dbo].[Products]
where productid=78
