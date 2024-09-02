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

