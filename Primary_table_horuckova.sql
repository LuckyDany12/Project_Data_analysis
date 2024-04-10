
CREATE OR REPLACE TABLE t_daniela_horuckova_project_sql_primary_final AS
SELECT
    cpib.name AS industry_branch, 
    cpib.code AS industry_code,
    cp2.value AS avg_payroll, 
    cp2.payroll_year, 
    cpc.name AS food_category, 
    cp.category_code, 
    cpc.price_value, 
    cpc.price_unit, 
    cp.value AS price
FROM czechia_price cp 
JOIN czechia_price_category cpc
    ON cp.category_code = cpc.code
JOIN 
	czechia_payroll cp2 
	ON YEAR(cp.date_from) = cp2.payroll_year AND
    cp2.value_type_code = 5958 AND 
    calculation_code = 200   
JOIN
	czechia_payroll_industry_branch cpib  
	ON cpib.code = cp2.industry_branch_code;

