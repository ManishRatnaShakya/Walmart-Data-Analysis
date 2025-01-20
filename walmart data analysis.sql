select * from Walmart.sales limit 5;

-- Time Of the Day --

Select time, (case
	WHEN `time` between "00:00:00" and "12:00:00" then "Morning"
    WHEN `time` between "12:01:00" and "16:00:00" then "Afternoon"
    else "Evening"
    End) as time_of_day from Walmart.sales;

ALTER TABLE Walmart.SALES
ADD COLUMN time_of_day varchar(10);

SET SQL_SAFE_UPDATES = 0;
update walmart.sales set time_of_day = (case
	WHEN `time` between "00:00:00" and "12:00:00" then "Morning"
    WHEN `time` between "12:01:00" and "16:00:00" then "Afternoon"
    else "Evening"
    End); 
    
    
-- How many distinct cities are present in the dataset? --
SELECT COUNT(DISTINCT CITY) FROM WALMART.SALES;

-- In which city is each branch situated?-- 
SELECT  distinct branch, CITY 
	FROM WALMART.SALES ;

-- How many distinct product lines are there in the dataset? --
SELECT count(DISTINCT `PRODUCT LINE`)
	FROM WALMART.SALES;

-- What is the most common payment method? --
select distinct payment, count(payment) as payment_done
	from walmart.sales
    group by payment 
	order by payment_done desc
    limit 1;

-- What is the most selling product line? --
SELECT DISTINCT `product line`, COUNT(`product line`) AS count_of_product_line
	from walmart.sales
    group by `product line`
    order by count_of_product_line desc
    limit 1;
    
-- What is the gender distribution per branch?
SELECT BRANCH, GENDER, COUNT(GENDER) AS TOTAL_PEOPLE
FROM WALMART.SALES GROUP BY BRANCH, GENDER 
ORDER BY TOTAL_PEOPLE, BRANCH;

SELECT  branch,
AVG(rating)  AS rating
FROM WALMART.SALES 
GROUP BY BRANCH
ORDER BY rating DESC;
