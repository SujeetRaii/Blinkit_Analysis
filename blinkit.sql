create database blinkitdb;

select count(*) as cnt from blinkit_data;
select * from blinkit_data
limit 10;

SET SQL_SAFE_UPDATES = 0;

update blinkit_data
set Item_Fat_Content =
case
when Item_Fat_Content in ('low fat', 'LF') then 'Low Fat'
when Item_Fat_Content in ('reg') then 'Regular'
else Item_Fat_Content
end; 

select distinct(Item_Fat_Content)
from blinkit_data;



-- TOTAL SALES
select concat(round(SUM(Sales)/1000000, 2) , 'M') as Total_Sales_Millions  
from blinkit_data;


-- Average SALES
select round(avg(Sales), 2) as Average_Sales
from blinkit_data;


-- Total Items
select count(*) as Total_Items 
from blinkit_data;


-- Average Rating
select round(avg(rating), 2) as Average_Rating
from blinkit_data;


-- select concat(round(SUM(Sales)/1000000, 2) , 'M') as Total_Sales_Millions_For_Low_Fat  
-- from blinkit_data
-- where Item_Fat_Content = 'Low Fat';

-- select concat(round(SUM(Sales)/1000000, 2) , 'M') as Total_Sales_Millions_For_Year_2022  
-- from blinkit_data
-- where Outlet_Establishment_Year = 2022;


select Item_Fat_Content , concat(round(sum(Sales)/1000000, 2), 'M') as Total_Sales
from blinkit_data
group by Item_Fat_Content
order by Total_Sales desc;

SELECT
    Item_Fat_Content,
    concat(ROUND(SUM(Sales) / 1000, 2) , ' K') AS Total_Sales_Thousands,
    ROUND(AVG(Sales), 2) AS Avg_Sales,
    COUNT(*) AS No_Of_Items,
    ROUND(AVG(Rating), 2) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_Thousands DESC;


select Item_Type , concat(round(SUM(Sales)/1000, 2) , ' k') as Total_Sales
from blinkit_data
group by Item_Type
order by Total_Sales desc;

SELECT
    Item_Type,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(AVG(Sales), 1) AS Avg_Sales,
    COUNT(*) AS No_Of_Items,
    ROUND(AVG(Rating), 2) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

-- Fat Content by Outlet for Total Sales:
SELECT 
    Outlet_Location_Type,
    ROUND(SUM(CASE WHEN Item_Fat_Content = 'Low Fat' THEN Sales ELSE 0 END), 2) AS Low_Fat_Sales,
    ROUND(SUM(CASE WHEN Item_Fat_Content = 'Regular' THEN Sales ELSE 0 END), 2) AS Regular_Sales,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Location_Type;

select 
    Outlet_Establishment_Year,
    round(sum(case when Item_Fat_Content = 'Low Fat' then Sales else 0 end), 2) as Low_Fat_Sales,
    round(sum(case when Item_Fat_Content = 'Regular' then Sales else 0 end), 2) as Regular_Sales,
    round(sum(Sales), 2) as Total_Sales
from blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year;


with cte as
(select Outlet_Size , round(sum(Sales),2) as Total_Sales
from blinkit_data
group by Outlet_Size
)
SELECT
    Outlet_Size,
    Total_Sales,
    ROUND(
        100.0 * Total_Sales / SUM(Total_Sales) OVER (),
        2
    ) AS Percentage
FROM cte
ORDER BY Total_Sales DESC;



with cte as
(select Outlet_Location_Type , round(sum(Sales),2) as Total_Sales
from blinkit_data
group by Outlet_Location_Type
)
SELECT
    Outlet_Location_Type,
    Total_Sales,
    ROUND(
        100.0 * Total_Sales / SUM(Total_Sales) OVER (),
        2
    ) AS Percentage
FROM cte
ORDER BY Total_Sales DESC;


SELECT 
    Outlet_Type,
    concat(ROUND(SUM(Sales) / 1000, 2) , ' K') AS Total_Sales_Thousands,
    ROUND(AVG(Sales), 2) AS Avg_Sales,
    COUNT(*) AS No_Of_Items,
    ROUND(AVG(Rating), 2) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Type
order by Total_Sales_Thousands;


select * from blinkit_data;