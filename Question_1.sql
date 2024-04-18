-- 1. Are wages rising in all industries over the years, or falling in some?

-- I calculated the average payroll for each industry and year. 
-- Additionally, I determined the trend of the average payroll over the years for each industry by comparing it to the previous year. 
-- If the average payroll decreased compared to the previous year, it was labeled as 'Decreasing'; if it increased, it was labeled as 'Increasing'; otherwise, it was labeled as 'NULL'. 
-- The results are grouped by industry code and payroll year.


SELECT
	industry_code,
	payroll_year,
	avg(avg_payroll) AS AVG_payroll,
	CASE 
       WHEN avg(avg_payroll) < LAG(avg(avg_payroll)) OVER (PARTITION BY industry_code ORDER BY payroll_year) THEN 'Decreasing'
       WHEN avg(avg_payroll) > LAG(avg(avg_payroll)) OVER (PARTITION BY industry_code ORDER BY payroll_year) THEN 'Increasing'
       ELSE 'NULL'
       END AS trend
FROM t_daniela_horuckova_project_sql_primary_final tdhpspf
GROUP BY industry_code, payroll_year;


-- Answer: Salaries for the specified period were overall increasing across all sectors, with occasional year-on-year declines observed in most sectors. 
-- Only sectors C - Manufacturing Industry, Q - Healthcare and Social Care, and S - Other Activities showed year-on-year increases and does not show any decreases over the monitored period. 
-- The worst situation was in the B sector - Mining and Quarrying industry, where wages declined even in 4 consecutive years, namely 2009, 2013, 2014, and 2016.
