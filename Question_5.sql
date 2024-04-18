-- 5. Does the level of GDP affect changes in wages and food prices? Or, if the GDP increases more significantly in one year, will this be reflected in food prices or wages in the same or the following year by a more significant increase?

-- This SQL query selects data from two tables, t_daniela_horuckova_project_sql_primary_final and t_daniela_horuckova_project_sql_secondary_final, 
-- focusing on the Czech Republic. It calculates the annual percentage increases in price, payroll, and GDP. 
-- The LAG function helps compare each year's values to the previous year's values, and the ROUND function ensures the results are rounded to two decimal places. 
-- Finally, the query groups the data by payroll year and filters out any years with only one record, ensuring meaningful comparisons.


SELECT
    tdhpspf.payroll_year,
    round((AVG(price) - LAG(AVG(price)) OVER (ORDER BY payroll_year)) / LAG(AVG(price)) OVER (ORDER BY payroll_year) * 100, 2) AS annual_increase_price,
    round((AVG(avg_payroll) - LAG(AVG(avg_payroll)) OVER (ORDER BY payroll_year)) / LAG(AVG(avg_payroll)) OVER (ORDER BY payroll_year) * 100, 2) AS annual_increase_payroll,
    round((AVG(tdhpssf.GDP) - LAG(AVG(tdhpssf.GDP)) OVER (ORDER BY payroll_year)) / LAG(AVG(tdhpssf.GDP)) OVER (ORDER BY payroll_year) * 100, 2) AS annual_increase_HDP
FROM 
    t_daniela_horuckova_project_sql_primary_final tdhpspf
JOIN 
    t_daniela_horuckova_project_sql_secondary_final tdhpssf
ON 
    tdhpspf.payroll_year = tdhpssf.year
WHERE 
    tdhpssf.country = 'Czech Republic'
GROUP BY 
    tdhpspf.payroll_year
HAVING 
    COUNT(*) > 1;
   
    
-- Answer: The GDP level does not have a direct impact on changes in wages and food prices in the current year or the previous year. 
-- Wages tend to increase over the long term regardless of economic development. In some weaker years, wages may even grow faster than GDP. 
-- Similarly, in some years of weaker GDP, food prices may increase disproportionately. For example, even though the GDP decreased compared to the previous year in 2012, food prices rose by more than 6%.