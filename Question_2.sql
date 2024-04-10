-- 2. How many liters of milk and kilograms of bread can be bought in the first and last comparable periods in the available price and wage data?

-- I modified a SQL query to retrieve average payroll and price data for two specific food categories, for the years 2006 and 2018. 
-- I adjusted the query to include both food categories by using the OR operator in the WHERE clause to filter rows for these categories. 
-- The resulting table includes columns for payroll year, food category, average payroll for those two years, average price of each food category and year, 
-- and the calculated column "Affordability Index", representing how many units of each food category people could afford to buy in years 2006 and 2018.


SELECT
	payroll_year,
	food_category,
	round(AVG(avg_payroll), 2) AS 'average_payrol',
	round(avg(price), 2) AS 'average_price',
	floor(avg(avg_payroll)/avg(price)) AS 'affordability Index',
	price_unit
FROM t_daniela_horuckova_project_sql_primary_final tdhpspf
WHERE (payroll_year = '2006' AND food_category IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový'))
	OR (payroll_year = '2018' AND food_category IN ('Mléko polotučné pasterované','Chléb konzumní kmínový'))
GROUP BY payroll_year, food_category;
