# Project Data Analysis with SQL

## Project for the Engeto Data Analysis Course - SQL Part

### MariaDB Documentation: [MariaDB Documentation](https://mariadb.com/kb/en/)

#### For successful execution of the script, the Engeto training database is required.

## Assignment Description

In our analytical department of an independent organization focusing on the standard of living of citizens, we have undertaken a project to address specific research questions regarding the accessibility of basic food items to the general public. Fundamental questions have been already defined to be answered. I aim to prepare robust data sets that allow for comparisons of food availability based on average incomes over specific time periods. Additionally, I will include supplementary material such as a table featuring GDP, GINI coefficient, and population data of other European countries for the same period, alongside the primary overview for the Czech Republic.

## Procedure

I have created two tables in the database from which the required data can be retrieved. With DBeaver and SQL queries, I filtered data to be able to answer the given questions. Procedure is described in each of the solved questions.

## Results

1. **Are salaries rising in all industries over the years, or falling in some?**
   - Salaries for the specified period were overall increasing across all sectors, with occasional year-on-year declines observed in most sectors. Sectors C (Manufacturing Industry), Q (Healthcare and Social Care), and S (Other Activities) showed year-on-year increases and no decreases over the monitored period. The worst situation was in sector B (Mining and Quarrying industry), where wages declined even in 4 consecutive years (2009, 2013, 2014, and 2016).

2. **How many liters of milk and kilograms of bread can be bought in the first and last comparable periods in the available price and wage data?**
   - In 2006, 1,312 kg of bread and 1,465 liters of milk could be bought. In 2018, 1,365 kg of bread and 1,669 liters of milk could be bought.

3. **Which food category is increasing in price the slowest (has the lowest percentage year-on-year increase)?**
   - The price of red apples and sugar is decreasing over the years, while bananas are showing the slowest price increase.

4. **Has there been a year in which the year-on-year increase in food prices was significantly higher than wage growth (higher than 10%)?**
   - No, there hasn't been a year in which the year-on-year increase in food prices exceeded wage growth by more than 10%. The largest decrease in prices compared to wages occurred between 2008 and 2009, with a difference of 9.65%. The largest increase in prices compared to wages occurred between 2012 and 2013, with a difference of 7.56%.

5. **Does the level of GDP affect changes in wages and food prices?**
   - The GDP level does not have a direct impact on changes in wages and food prices in the current year or the previous year. Wages tend to increase over the long term regardless of economic development. In some weaker years, wages may even grow faster than GDP. Similarly, in some years of weaker GDP, food prices may increase disproportionately. For example, even though the GDP decreased compared to the previous year in 2012, food prices rose by more than 6%.