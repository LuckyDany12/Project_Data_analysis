CREATE OR REPLACE TABLE t_daniela_horuckova_project_sql_secondary_final AS 
SELECT 
	c.country,
	c.population,
	e.`year` AS `year`,
	round (e.gdp,2) AS GDP,
	e.gini,
	round (e.taxes,2) AS taxes
FROM countries c
JOIN economies e
	ON c.country = e.country 
WHERE c.continent = 'Europe' AND e.`year` BETWEEN 2006 AND 2018
ORDER BY country, `year`;