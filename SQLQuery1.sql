create database PRJ_db

---import KMS SQL project case study--

select * from [KMS Sql Case Study]

Alter table [KMS Sql Case Study]
alter column Discount decimal(5,2)

Alter table [KMS Sql Case Study]
alter column Shipping_Cost decimal (5,2)




Alter table [KMS Sql Case Study]
alter column Product_Base_Margin decimal (5,2)


---import order csv file

---JOIN--

Select * from [KMS Sql Case Study] 

Select * from VW_KMSales_Returned


Select * from Order_status

---SQL OPTIMIZATION--

Select * from [KMS Sql Case Study] 

[KMS Sql Case Study] K
Order_Status O


select * from Order_status
Select K.Row_ID,
       K.Order_ID,
       K.Order_Date,
       K .Order_Quantity,
       K .Sales,
       K.Discount,
       K .Profit,
       K .Unit_Price,
       K .Shipping_Cost,
       K.Ship_Mode,
       K .Customer_Name,
       K.Region,
       K.Customer_Segment,
       K .Product_Category,
       K.Ship_Date,
       O.Status 
from [KMS Sql Case Study] K
Join Order_status O
on O.Order_ID = K.Order_ID


Create View [dbo].[VW_KMSales_Returned3]
 as
Select K.Row_ID,
       K.Order_ID,
       K.Order_Date,
       K .Order_Quantity,
       K .Sales,
       K.Discount,
       K .Profit,
       K .Unit_Price,
       K .Shipping_Cost,
       K.Ship_Mode,
       K.Product_Container,
       K.Product_Base_Margin,
       K .Customer_Name,
       K.Region,
       K.Customer_Segment,
       K .Product_Category,
       k.Product_Sub_Category,
       K.Ship_Date,
       O.[Status] 
from [KMS Sql Case Study] K
FULL Join Order_status O
on O.Order_ID = K.Order_ID

Select * from [dbo].[VW_KMSales_Returned3]




 ---Analysis---

--Question 1 Which product category had the highest sales.-- 

Select product_category,MAX(Sales) as Highest_Sales
from VW_KMSales_Returned3
Group by product_category
Order by Highest_Sales Desc

--Qestion2 What are the Top3 & Bottom3  region in term of sales

Select top 3 
      Region,MAX(Sales) AS Highest_Sales
    from VW_KMSales_Returned3
    Group by Region
    Order by Highest_Sales Desc
 

---Bottom 3, The reverse of the initial query using Ascending

Select Top 3 
    Region,MIN(Sales) as Lowest_Sales
 from VW_KMSales_Returned3
Group by Region
Order by Lowest_Sales Desc



--Question3 What were the total sales of appliances in Ontario

SELECT Product_Sub_Category,Region,MAX(Sales) as Total_Sales
from[dbo].[VW_KMSales_Returned3]
WHERE Product_Sub_Category = 'Appliances' And Region = 'Ontario'
Group by Product_Sub_Category,Region

 --Question 4, Advise the management of KMS on what to do, to increase the revenue
-- from the bottom 10 customer?

select top 10 
        Customer_Name,MIN(Sales) AS Lowest_Sales
 from  [dbo].[VW_KMSales_Returned3] 
 Group by Customer_Name
 Order by Lowest_Sales Desc


 --Question 5, KMS incurred the most shipping cost using which shipping mode--

Select Ship_Mode,SUM(Shipping_Cost) AS Highest_Shipping_Cost
from [dbo].[VW_KMSales_Returned3]
Group by Ship_Mode
Order by Highest_Shipping_Cost Desc


   
   --Question 6, Who are the most valuable customer and what products or 
   --services do they typically purchase?

Select top 20 
    Customer_Name, Product_Category,SUM(Sales) AS Total_Sales
from [dbo].[VW_KMSales_Returned3]
Group by Product_Category, Customer_Name
Order by Total_Sales Desc 

---Question 7 Which small business customer has the highest sales

Select Customer_Name,Customer_Segment,sum(Sales) AS Highest_Sales
           from [dbo].[VW_KMSales_Returned3]
        WHERE Customer_Segment = 'Small Business'
        Group by Customer_Name,Customer_Segment
        Order by Highest_Sales Desc

 ----Question 8 Which Corporate Customer placed the most number of Orders in 2009-2012

select  top 10
    Customer_Name,Customer_Segment,Order_Date,MAX(Order_Quantity)as Total_Orders
  from [dbo].[VW_KMSales_Returned3]
  WHERE Customer_Segment = 'Corporate' And Order_Date BETWEEN  '2009' AND '2012'
  Group by Customer_Name, Customer_Segment,Order_Date
  Order by Customer_Name, Order_Date,Total_Orders Desc

----Question 9, Which consumer customer was the most profitable one?

Select top 20
       Customer_Name,Customer_Segment,SUM(Profit) As Total_Profit
from [dbo].[VW_KMSales_Returned3]
Where Customer_Segment = 'Consumer'
Group by Customer_Name, Customer_Segment
Order by Total_Profit Desc

----Question 10,Which customer returned items,and what segment do they belong to ?

   select 
           Customer_Name,Customer_Segment,COUNT(Distinct[Status]) AS Quantity_Returns
           from VW_KMSales_Returned3
           Group by Customer_Name,[Customer_Segment]
           Order by Quantity_Returns Desc
           

 --Question 11, If the delivery truck is the most economical, and the slowest shipping method.
 --The Air Express is the fastest and the most of expensive. 
 --Do you think the company appropriately spent shipping cost based on the order priority ?
    
   SELECT  Ship_Mode,Order_Priority,MAX(Shipping_Cost) AS Highest_Shipping_Cost
   from  [KMS Sql Case Study]
   Where Ship_Mode IN ('Delivery Truck','Regular Air', 'Express Air') AND Order_Priority IN ('Critical','High','Medium', 'Low','Not Specified')
   Group by Ship_Mode, Order_Priority
   Order by Ship_Mode,Order_Priority,Highest_Shipping_Cost Desc


   ---ANSWER, Using the above Database query methods(factoring in the variables and the Constant values)
   -- combining Aggregators,range and logical operators,to fetch or query the database
   -- from the result and information supplied, The Shipping mode with the highest cost,at the hihest peak of prority (CRITICAL)is Delivery truck, which is the cheapest and slowest 
--Thus,the company does not appropriately spent shipping cost base on the order of priority, but either base on quantity order or availabilty of the means of shipment. 




Select * from [dbo].[VW_KMSales_Returned3]

