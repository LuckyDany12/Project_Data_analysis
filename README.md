# Project_Data_analysis_SQL
## Project for Engeto data analysis course - SQL part

### MariaDB documentation: https://mariadb.com/kb/en/
### For the successful running of the script you need ENGETO training database.

## Assignment description

### In our analytical department of an independent organization focusing on the standard of living of citizens, we have undertaken a project to address specific research questions regarding the accessibility of basic food items to the general public. Fundamental questions have been already defined to be answered.
### I aim to prepare robust data sets that allow for comparisons of food availability based on average incomes over specific time periods. Additionally, I will include supplementary material such as a table featuring GDP, GINI coefficient, and population data of other European countries for the same period, alongside the primary overview for the Czech Republic.

## Analysis

### whats in data

## Procedure

### I have created two tables in the database from which the required data can be retrieved. With Dbeaver and SQL queries I filtred data to be able to answer the given questions.


## Results

### 1. Are salaries rising in all industries over the years, or falling in some?
#### Salaries for the specified period were overall increasing across all sectors, with occasional year-on-year declines observed in most sectors. Only sectors C, Q, and S showed year-on-year increases."

### 2. How many liters of milk and kilograms of bread can be bought in the first and last comparable periods in the available price and wage data?
#### In 2006 could be bought 1,312 kg of bread and 1,465 liters of milk and in 2018 could be bought 1,365 kg of bread and 1,669 liters of milk.

### 3. Which food category is increasing in price the slowest (has the lowest percentage year-on-year increase)?
#### The price of red apples and sugar is decreasing over the years, bananas are increasing in price slowes.

### 4. Has there been a year in which the year-on-year increase in food prices was significantly higher than wage growth (higher than 10%)?
#### No, there hasn't been a year in which the year-on-year increase in food prices exceeded wage growth by more than 10%. The largest increase in prices compared to wages occurred between the years 2012 and 2013, with a difference of 7.56%.

### 5. Does the level of GDP affect changes in wages and food prices? Or, if the GDP increases more significantly in one year, will this be reflected in food prices or wages in the same or the following year by a more significant increase?