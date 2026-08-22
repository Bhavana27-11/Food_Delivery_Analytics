
CREATE DATABASE food_delivery_db;
USE food_delivery_db;
SELECT * FROM food_delivery_analytics LIMIT 10;
SELECT count(*) AS Total_Records FROM food_delivery_analytics;
DESCRIBE food_delivery_analytics;
SELECT * FROM food_delivery_analytics WHERE Order_ID IS NULL OR Customer_Age IS NULL
   OR Revenue_USD IS NULL OR Profit_USD IS NULL OR Customer_Rating IS NULL; 
SELECT Order_ID,count(*) AS Duplicate_Count FROM food_delivery_analytics 
GROUP BY Order_ID HAVING count(*)>1;
UPDATE food_delivery_analytics SET Customer_Type = TRIM(Customer_Type),
Restaurant_Type = TRIM(Restaurant_Type),Cuisine_Type = TRIM(Cuisine_Type),
Weather_Condition = TRIM(Weather_Condition),Traffic_Level = TRIM(Traffic_Level),
City = TRIM(City);
UPDATE food_delivery_analytics SET Customer_Type = UPPER(Customer_Type),
Restaurant_Type = UPPER(Restaurant_Type),Cuisine_Type = UPPER(Cuisine_Type),
Weather_Condition = UPPER(Weather_Condition),Traffic_Level = UPPER(Traffic_Level),
City = UPPER(City);
SELECT * FROM food_delivery_analytics WHERE Customer_Age < 18 OR Customer_Age > 100;
SELECT * FROM food_delivery_analytics WHERE Customer_Rating < 1 OR Customer_Rating > 5;
SELECT * FROM food_delivery_analytics WHERE Order_Value_USD < 0 OR Revenue_USD < 0;
CREATE TABLE food_delivery_analytics_clean AS
SELECT Order_ID,Customer_Age,TRIM(UPPER(Customer_Type)) AS Customer_Type,
TRIM(UPPER(Restaurant_Type)) AS Restaurant_Type,TRIM(UPPER(Cuisine_Type)) AS Cuisine_Type,
Delivery_Distance_KM,Order_Value_USD,Revenue_USD,Profit_USD,Customer_Rating,
Weather_Condition,Traffic_Level,TRIM(UPPER(City)) AS City,Item_Count,
Complaint_Flag,Refund_Flag,Month,Quarter,Demand_Score,Churn_Risk FROM food_delivery_analytics;
SELECT * FROM food_delivery_analytics_clean LIMIT 10;

