select * 
from GlobalSuperstore..Orders
order by 1

--select * 
--from GlobalSuperstore..People

--select * 
--from GlobalSuperstore..Returns

-------------------------------------------------------
--Data count in the Order table
Select count(*)
from GlobalSuperstore..Orders

--How many registered customer in the order dataset
select distinct([Customer Name]),[Customer ID],[Order ID],Country,City,[Postal Code]
from GlobalSuperstore..Orders
where [Customer ID] is not null

--Calculating frequency of each order id by customer name in desc order
Select [Order ID],[Customer Name],count([Order ID]) as Total_order_id
from GlobalSuperstore..Orders
group by [Order ID],[Customer Name]
order by Total_order_id desc

--No of customers in each region in desc order
select Region,count(*) as no_of_customer
from GlobalSuperstore..Orders
group by Region
order by 2 desc

--sum of total sales of superstore
select sum(Sales) as total_sales
from GlobalSuperstore..Orders

--region having maximum no of customers
select Region,COUNT(*) as no_of_customers
from GlobalSuperstore..Orders
group by Region
order by 2 desc 

--Display the records for customers who live in state california and postal code 90032
select *
from GlobalSuperstore..Orders
where State='California' and [Postal Code]=90032

--Check shipped date less than order date.
Select *
from GlobalSuperstore..Orders
where [Ship Date]<[Order Date]

--Check distinct type of ship mode 
Select distinct [Ship Mode]
from GlobalSuperstore..Orders

--Check which order take how many days for delivered.
select DATEDIFF(day,[Order Date],[Ship Date]) as NumberOfDays,*
from GlobalSuperstore..Orders

--orders based on customers id
Select [Customer ID],[Order ID], count(*) as NumberOfItems
from GlobalSuperstore..Orders
group by [Customer ID],[Order ID]
order by [Customer ID]

--Shows details of a specific orderId , ex=CA-2013-103982
Select * 
from GlobalSuperstore..Orders
where [Order ID]='CA-2013-103982'

--Ship_Mode category analysis
select [Ship Mode],Category, [Sub-Category],sum(quantity) as TotalQuantity
from GlobalSuperstore..Orders
group by [Ship Mode],Category,[Sub-Category]
order by [Ship Mode]

--State wise maximum sales analysis
select State,max(Sales) as MaximumSales
from GlobalSuperstore..Orders
group by State
order by MaximumSales desc

--State wise Maximum profit analysis
select State,max(Profit) as MaximumProfit
from GlobalSuperstore..Orders
group by State
order by MaximumProfit desc

--maximum sales category wise
Select State,Category,[Sub-Category],max(Sales) as MaximunSales
from GlobalSuperstore..Orders
group by State,Category,[Sub-Category]
order by Category