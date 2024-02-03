1.   Show the category_name and description from the categories table sorted by category_name:
Q:   SELECT category_name, description from categories order by category_name;
2.   Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain':
Q:   SELECT contact_name, address, city from customers where country not in ('Germany', 'Mexico', 'Spain');
3.   Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26:
Q:   SELECT order_date, shipped_date, customer_id, freight from orders where order_date = '2018-02-26';
4.   Show the employee_id, order_id, customer_id, required_date, shipped_date from all orders shipped later than the required date:
Q:   SELECT employee_id, order_id, customer_id, required_date, shipped_date from orders where shipped_date > required_date;
5.   Show all the even numbered Order_id from the orders table:
Q:   SELECT order_id from orders where order_id%2=0;
6.   Show the city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name:
Q:   SELECT city, company_name, contact_name from customers where city like '%l%' order by contact_name;
7.   Show the company_name, contact_name, fax number of all customers that has a fax number. (not null):
Q:   SELECT company_name, contact_name, fax from customers where fax not null;
8.   Show the first_name, last_name. hire_date of the most recently hired employee:
Q:   SELECT first_name, last_name, max(hire_date) from employees;
9.   Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table:
Q:   SELECT round(avg(unit_price),2) as average_price, sum(units_in_stock) AS total_stock, sum(discontinued) AS total_discontinued from products;
10.  Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table:
Q:   SELECT product_name, company_name, category_name from products join suppliers on products.supplier_id = suppliers.supplier_id JOIN categories ON products.category_id = categories.category_id;
11.   Show the category_name and the average product unit price for each category rounded to 2 decimal places:
Q:   SELECT category_name, round(avg(unit_price),2) AS rounded_AVG_unit_price from categories JOIN products on categories.category_id = products.category_id group by category_name;
