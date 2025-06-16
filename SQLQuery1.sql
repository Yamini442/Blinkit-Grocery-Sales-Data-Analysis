CREATE DATABASE BLINKIT_DB
USE BLINKIT_DB

SELECT * FROM BLINKIT_DATA
SELECT COUNT(*) FROM BLINKIT_DATA
SELECT DISTINCT(Item_Fat_Content) FROM Blinkit_data

UPDATE BLINKIT_DATA
SET Item_Fat_Content =
CASE
WHEN Item_Fat_Content IN ('LF','low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END

SELECT CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)) AS TOTAL_SALES_MILLIONS 
FROM BLINKIT_DATA

SELECT CAST(AVG(Sales) AS DECIMAL(10,0)) AS AVG_SALES
FROM BLINKIT_DATA

SELECT COUNT(*) AS No_of_Items FROM BLINKIT_DATA

SELECT CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING FROM BLINKIT_DATA

SELECT Item_Fat_Content ,
       CAST(SUM(Sales)/1000 AS DECIMAL(10,2)) AS TOTAL_SALES_THOUSANDS,
	   CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	   COUNT(*) AS No_of_Items,
	   CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING 
FROM BLINKIT_DATA
GROUP BY Item_Fat_Content
ORDER BY TOTAL_SALES_THOUSANDS DESC

SELECT Item_Type ,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	   CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	   COUNT(*) AS No_of_Items,
	   CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING 
FROM BLINKIT_DATA
GROUP BY Item_Type
ORDER BY TOTAL_SALES DESC

SELECT Outlet_Location_Type,
       ISNULL([Low Fat],0) AS Low_Fat,
	   ISNULL([Regular],0) AS Regular
FROM
(
     SELECT Outlet_Location_Type, Item_Fat_Content,
            CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES 
     FROM BLINKIT_DATA
     GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SOURCETABLE
PIVOT
    (
	  SUM(TOTAL_SALES)
	  FOR Item_Fat_Content IN ([Low Fat],[Regular])
	  ) AS PIVOTTABLE
ORDER BY Outlet_Location_Type

SELECT Outlet_Location_Type,
       ISNULL([Low Fat],0) AS Low_Fat,
	   ISNULL([Regular],0) AS Regular
FROM
(
     SELECT Outlet_Location_Type, Item_Fat_Content,
	 CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES
     FROM BLINKIT_DATA
     GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SOURCETABLE
PIVOT
    (
	  SUM(AVG_SALES)
	  FOR Item_Fat_Content IN ([Low Fat],[Regular])
	  ) AS PIVOTTABLE
ORDER BY Outlet_Location_Type

SELECT Outlet_Location_Type,
       ISNULL([Low Fat],0) AS Low_Fat,
	   ISNULL([Regular],0) AS Regular
FROM
(
     SELECT Outlet_Location_Type, Item_Fat_Content,
	 	   COUNT(*) AS No_of_Items
     FROM BLINKIT_DATA
     GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SOURCETABLE
PIVOT
    (
	  SUM(No_of_Items)
	  FOR Item_Fat_Content IN ([Low Fat],[Regular])
	  ) AS PIVOTTABLE
ORDER BY Outlet_Location_Type

SELECT Outlet_Location_Type,
       ISNULL([Low Fat],0) AS Low_Fat,
	   ISNULL([Regular],0) AS Regular
FROM
(
     SELECT Outlet_Location_Type, Item_Fat_Content,
	 CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING 
     FROM BLINKIT_DATA
     GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SOURCETABLE
PIVOT
    (
	  SUM(AVG_RATING)
	  FOR Item_Fat_Content IN ([Low Fat],[Regular])
	  ) AS PIVOTTABLE
ORDER BY Outlet_Location_Type

SELECT Outlet_Establishment_Year,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	   CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	   COUNT(*) AS No_of_Items,
	   CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING 
FROM BLINKIT_DATA
GROUP BY Outlet_Establishment_Year
ORDER BY TOTAL_SALES DESC

SELECT Outlet_Size ,
       CAST(SUM(SALES) AS DECIMAL(10,2)) AS TOTAL_SALES,
	   CAST((SUM(SALES)*100.0/SUM(SUM(SALES)) OVER()) AS DECIMAL(10,2)) AS SALES_PERCENTAGE
FROM BLINKIT_DATA
GROUP BY Outlet_Size
ORDER BY TOTAL_SALES DESC

SELECT Outlet_Location_Type,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	   CAST((SUM(SALES)*100.0/SUM(SUM(SALES)) OVER()) AS DECIMAL(10,2)) AS SALES_PERCENTAGE ,
	   CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	   COUNT(*) AS No_of_Items,
	   CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING 
FROM BLINKIT_DATA
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_SALES DESC


SELECT Outlet_Type,
       CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	   CAST((SUM(SALES)*100.0/SUM(SUM(SALES)) OVER()) AS DECIMAL(10,2)) AS SALES_PERCENTAGE ,
	   CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	   COUNT(*) AS No_of_Items,
	   CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_RATING 
FROM BLINKIT_DATA
GROUP BY Outlet_Type
ORDER BY TOTAL_SALES DESC

SELECT * FROM BLINKIT_DATA



