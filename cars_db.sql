/* create a database for cars_data.csv */
CREATE DATABASE cars24_db;

/* use the database which is created for car_data.csv */
USE cars24_db;

/* create a table based on the car_data.csv created a primary key to the table and named as cars_data */
CREATE TABLE cars_data (
    Car_Model INT,
    Brand VARCHAR(50),
    Car_Name VARCHAR(100),
    Car_Variant VARCHAR(100),
    Car_Transmission VARCHAR(50),
    KM_Driven INT,
    Owner_Type VARCHAR(50),
    Fuel_Type VARCHAR(50),
    Registration_ID VARCHAR(50) PRIMARY KEY,
    Monthly_EMI INT,
    Car_Price_Lakhs DECIMAL(10,2),
    Downpayment_Amount DECIMAL(10,2),
    Location VARCHAR(100)
);


/* Use the Import Wizard to import the `car_data.csv` file into the `cars24_db` database, 
specifically into the existing table named `cars_data`. 
After the import is complete, review the data to ensure that all records have been correctly imported. 
Due to the default limit of 1000 rows, use `LIMIT 1467` to retrieve up to 1467 rows and confirm that all records are present.
*/
 SELECT * FROM cars_data;
 
 /* How many cars are there for each brand, and which brands have the highest number of cars? */ 
 SELECT Brand,COUNT(*) AS Number_of_Cars 
 FROM cars_data 
 GROUP BY Brand 
 ORDER BY COUNT(*) DESC;
 
 /*How many cars are there for each Car_Transmission? */ 
 SELECT Car_Transmission,COUNT(*) AS Number_of_Cars 
 FROM cars_data 
 GROUP BY Car_Transmission 
 ORDER BY Number_of_Cars DESC;
 
 
/* How many cars are there for each Car_Model and which Car_Model have the highest number of cars? */
 SELECT Car_Model,COUNT(*) AS Number_of_Cars 
 FROM cars_data 
 GROUP BY Car_Model 
 ORDER BY COUNT(*) DESC;

/* List all the cars located in delhi? */
SELECT * FROM cars_data 
WHERE lower(Location) like "%delhi%" ;

/* Find the average price of each Brand and 
which Brand have the highest average price? */
SELECT Brand,ROUND(AVG(Car_Price_Lakhs),2) AS Average_Price_Lakhs
FROM cars_data 
GROUP BY Brand 
ORDER BY Average_Price_Lakhs DESC;

/* Find the maximum price of cars for each transmission type? */
SELECT Car_Transmission, MAX(Car_Price_Lakhs) AS Max_Price 
FROM cars_data 
GROUP BY Car_Transmission;

/* Find the total number of cars for each owner type? */
SELECT Owner_Type, COUNT(*) AS Total_Cars 
FROM cars_data 
GROUP BY Owner_Type;

/* List the total number of cars in each location? */
SELECT Location, COUNT(*) AS Total_Cars 
FROM cars_data 
GROUP BY Location;


/*Find the average kilometers driven for each fuel type? */
SELECT Fuel_Type, AVG(KM_Driven) AS Average_KM 
FROM cars_data 
GROUP BY Fuel_Type;

/* Find the average downpayment amount for each brand? */
SELECT Brand, ROUND(AVG(Downpayment_Amount)) AS Average_Downpayment 
FROM cars_data 
GROUP BY Brand;

/* Find the top 5 most expensive cars? */
SELECT * FROM cars_data 
ORDER BY Car_Price_Lakhs DESC 
LIMIT 5;

/* Find the bottom 5 cars with the least kilometers driven? */
SELECT * FROM cars_data 
ORDER BY KM_Driven ASC 
LIMIT 5;

/* List all cars with a monthly EMI above the average monthly EMI? */
SELECT * FROM cars_data 
WHERE Monthly_EMI > 
(SELECT AVG(Monthly_EMI) 
FROM cars_data);
 
/* Find the total number of cars for each combination of brand and fuel type 
which have the highest number of cars? */ 
SELECT Brand, Fuel_Type, COUNT(*) AS Total_Cars 
FROM cars_data 
GROUP BY Brand, Fuel_Type 
ORDER BY Total_Cars DESC;

/* Find the total price of cars listed for each owner type? */
SELECT Owner_Type, SUM(Car_Price_Lakhs) AS Total_Price 
FROM cars_data 
GROUP BY Owner_Type;


/* Rank top 5 cars based on their price within each brand? */
SELECT 
	Brand,
    Car_Name,
    Car_Price_Lakhs,
    RANK() OVER (PARTITION BY Brand ORDER BY Car_Price_Lakhs DESC) AS Price_Rank 
FROM cars_data 
ORDER BY Price_Rank>6;


/* Find the lead and lag values of car prices within each Car_Name? */
SELECT 
    Car_Name,
    Car_Price_Lakhs,
    LEAD(Car_Price_Lakhs) OVER (PARTITION BY Car_Name ORDER BY Car_Price_Lakhs) AS Next_Car_Price, 
    LAG(Car_Price_Lakhs) OVER (PARTITION BY Car_Name ORDER BY Car_Price_Lakhs) AS Previous_Car_Price 
FROM cars_data;
 

/* Find the Nth highest car price within each brand (3rd highest)? */
SELECT 
    Brand, 
    Car_Name, 
    Car_Price_Lakhs 
FROM (
    SELECT 
        Brand, 
        Car_Name, 
        Car_Price_Lakhs, 
        ROW_NUMBER() OVER (PARTITION BY Brand ORDER BY Car_Price_Lakhs DESC) AS Row_Num 
    FROM cars_data
) AS ranked_cars 
WHERE Row_Num = 3;

/* Find the percentage rank of Monthly EMI within each brand? */
SELECT 
    Brand,
    Car_Name,
    Monthly_EMI,
    ROUND(PERCENT_RANK() OVER (PARTITION BY Brand ORDER BY Monthly_EMI),2) AS EMI_Percent_Rank 
FROM cars_data;


/* CTE to find the year-over-year change in the average price of cars? */
WITH Yearly_Averages AS (
    SELECT 
        Car_Model, 
        AVG(Car_Price_Lakhs) AS Average_Price 
    FROM cars_data 
    GROUP BY Car_Model
)
SELECT 
    ya1.Car_Model AS Year, 
    ya1.Average_Price AS This_Year_Average, 
    ya2.Average_Price AS Previous_Year_Average, 
    ya1.Average_Price - ya2.Average_Price AS Year_Over_Year_Change 
FROM Yearly_Averages ya1
LEFT JOIN Yearly_Averages ya2 
ON ya1.Car_Model = ya2.Car_Model + 1 
ORDER BY Year ASC;
