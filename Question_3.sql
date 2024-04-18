--  3. Which food category is increasing in price the slowest (has the lowest percentage year-on-year increase)?

-- This SQL code calculates the average annual increase percentage for each food category. 
-- It does so by first computing the annual increase percentage for each category and year, and then averaging these percentages for each category. 
-- The result is presented with the percentage symbol (%) and rounded to two decimal places. 
-- Finally, the results are grouped by food category and sorted in ascending order of the average annual increase percentage."


SELECT 
    food_category,
    concat(round(AVG(annual_increase_percentage),2), '%') AS average_annual_increase
FROM (
    SELECT 
        food_category,
        payroll_year,
        ROUND(((AVG(price) - LAG(AVG(price)) OVER (PARTITION BY food_category ORDER BY payroll_year)) / LAG(AVG(price)) OVER (PARTITION BY food_category ORDER BY payroll_year) * 100), 2) 
    			AS annual_increase_percentage
    FROM t_daniela_horuckova_project_sql_primary_final
    GROUP BY food_category, payroll_year
) AS subquery
GROUP BY food_category
ORDER BY average_annual_increase ASC;


-- Answer: The price of red apples and sugar is decreasing over the years, while bananas are showing the slowest price increase.