-- 4. Has there been a year in which the year-on-year increase in food prices was significantly higher than wage growth (higher than 10%)?

-- This code calculates trends in food prices and average payroll over multiple years and food categories. 
-- It first creates a common table expression (CTE) called "trends" to compute the average prices, average payroll, and year-on-year increases in prices and payroll for each year and food category. 
-- Then, it selects all needed information to view annual increase percentage difference between prices and payroll. Finally, it groups the results by payroll year to provide summarized insights.


WITH trends AS (
    SELECT 
        payroll_year,
        food_category,
        AVG(price) AS avg_price,
        AVG(avg_payroll) AS avg_payroll,
        ((AVG(price) - LAG(AVG(price)) OVER (PARTITION BY food_category ORDER BY payroll_year)) / LAG(AVG(price)) OVER (PARTITION BY food_category ORDER BY payroll_year) * 100) 
        	AS annual_increase_price,
        ((AVG(avg_payroll) - LAG(AVG(avg_payroll)) OVER (PARTITION BY food_category ORDER BY payroll_year)) / LAG(AVG(avg_payroll)) OVER (PARTITION BY food_category ORDER BY payroll_year) * 100) 
        	AS annual_increase_payroll
    FROM 
        t_daniela_horuckova_project_sql_primary_final
    GROUP BY 
        payroll_year, food_category
)
SELECT 
    payroll_year,
    ROUND(AVG(avg_price), 2) AS average_prices,
    ROUND(AVG(avg_payroll), 2) AS average_payroll,
    ROUND(AVG(annual_increase_price), 2) AS annual_increase_price,
    ROUND(AVG(annual_increase_payroll), 2) AS annual_increase_payroll,
    ROUND(AVG(annual_increase_price - annual_increase_payroll), 2) AS annual_increase_difference
FROM 
    trends
GROUP BY 
    payroll_year;
    

-- Answer: No, there hasn't been a year in which the year-on-year increase in food prices exceeded wage growth by more than 10%. 
-- The largest decrease in prices compared to wages occurred between 2008 and 2009, with a difference of 9.65%. 
-- The largest increase in prices compared to wages occurred between 2012 and 2013, with a difference of 7.56%.