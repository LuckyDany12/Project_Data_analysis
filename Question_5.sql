-- Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

	

SELECT
	tdhpspf.payroll_year,
    ((AVG(price) - LAG(AVG(price)) OVER (PARTITION BY food_category ORDER BY payroll_year)) / LAG(AVG(price)) OVER (PARTITION BY food_category ORDER BY payroll_year) * 100) AS annual_increase_price,
    ((AVG(avg_payroll) - LAG(AVG(avg_payroll)) OVER (PARTITION BY food_category ORDER BY payroll_year)) / LAG(AVG(avg_payroll)) OVER (PARTITION BY food_category ORDER BY payroll_year) * 100) AS annual_increase_payroll,
    tdhpssf.GDP
FROM 
    t_daniela_horuckova_project_sql_primary_final tdhpspf
JOIN 
    t_daniela_horuckova_project_sql_secondary_final tdhpssf
ON 
    tdhpspf.payroll_year = tdhpssf.year
WHERE 
    tdhpssf.country = 'Czech Republic'
GROUP BY tdhpspf.payroll_year;
