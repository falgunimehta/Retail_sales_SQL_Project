create database sales;
use sales;

show tables;

select * from sales;

select count(*) from sales;

-- data cleaning
select * from sales
where transactions_id is null;

select * from sales
where sale_date is null;

select * from sales
where sale_time is null;
    

#task how many sales we have?
select count(*) as total_sale from sales;

#task how many uniuque customers we have ?
select count(distinct customer_id) as total_sale from sales;

#task write a sql query to retrieve all columns for sales made on '2022-11-05
select * from sales
where sale_date = '2022-11-05';

#task write a sql query to calculate the total sales (total_sale) for each category.
select 
    category,
    sum(total_sale) as net_sale
from sales
group by 1;

#task write a sql query to find the average age of customers who purchased items from the 'beauty' category.
select round(avg(age), 2) as avg_age
from sales
where category = 'beauty';

#task write a sql query to find all transactions where the total_sale is greater than 1000.
select * from sales
where total_sale > 1000;

#task write a sql query to find the total number of transactions (transaction_id)made by each gender in each category.
select category,gender,count(*) as total_trans
from sales
group by 
    category,
    gender
order by 1;

#task write a sql query to calculate the average sale for each month.find out best selling month in each year
    select year(sale_date) as year, month(sale_date) as month , avg(total_sale) from sales
group by year, month
order by 3 desc
limit 1;

#task write a sql query to find the top 5 customers based on the highest total sales 
select 
    customer_id,
    sum(total_sale) as total_sales
from sales
group by 1
order by 2 desc
limit 5;

#task write a sql query to find the number of unique customers who purchased items from each category.
select 
    category,    
    count(distinct customer_id) as cnt_unique_cs
from sales
group by category;
