use northwnd

 --1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName
 select [CategoryName],[Description]
 from [dbo].[Categories]
 order by [CategoryName]
 --2.Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
select 
[ContactName],[CompanyName],[ContactTitle],[Phone]
from Customers
order by phone
/*3.Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname
respectively and HireDate from the employees table sorted from the newest to the oldest employee*/
 select upper([FirstName]),upper([LastName]),[HireDate]
 from [dbo].[Employees]
 order by hiredate desc
 /*4.Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight
 from the orders table sorted by Freight in descending order*/
 select top 10 [OrderID],[OrderDate],[ShippedDate],[CustomerID],[Freight]
 from [dbo].[Orders]
 order by Freight desc

 --5.Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table
  select lower([CustomerID]) as ID
  from [dbo].[Customers]
 --12.
  USE NORTHWND
 SELECT EmployeeID,OrderID,CustomerID,RequiredDate,ShippedDate 
 FROM orders
WHERE ShippedDate > RequiredDate;
--13. Tạo báo cáo hiển thị Thành phố, Tên công ty, Tên liên hệ của khách hàng từ các thành phố bắt đầu bằng A hoặc B.
SELECT City,CompanyName,ContactName
from Customers
where city like 'A%' or city like 'B%'
--14. Tạo một báo cáo hiển thị tất cả các số chẵn của OrderID từ bảng đơn hàng.
select orderID
from orders
where orderID % 2 = 0
--15. Tạo một báo cáo hiển thị tất cả các đơn hàng có chi phí vận chuyển lớn hơn 500 USD.
select *
from [dbo].[Orders]
where [Freight] > 500