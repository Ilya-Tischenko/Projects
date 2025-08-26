-- Названия компаний из Франции и их адреса
SELECT company_name,
address
FROM northwind.customers
WHERE country = 'France'

-- Имена и фамилии сотруников из Лондона, чей домашний номер оканчивается на 8
SELECT first_name,
last_name
FROM employees
WHERE home_phone LIKE '%8'

-- Название товара и их поставщика для всех товаров, у которых указан поставщик
SELECT product_name,
company_name
FROM products AS p 
JOIN suppliers AS s ON p.supplier_id = s.supplier_id

-- Страны, в которых оформили более 30 заказов, и количество заказов для каждой из них
SELECT ship_country,
COUNT(order_id)
FROM orders
GROUP BY ship_country
HAVING COUNT(order_id) > 30
ORDER BY ship_country

-- Информация о каждом товаре: его идентификатор, название, категория, описание. Сортировка по возрастанию идентификаторов
SELECT product_id,
product_name,
category_name,
description
FROM products AS p 
JOIN categories AS c ON p.category_id = c.category_id 
ORDER BY product_id

-- Суммарная выручка с продаж за каждый год с учетом скидок. Сортировка по убыванию выручки.
SELECT EXTRACT(YEAR FROM order_date),
ROUND(SUM(unit_price * quantity * (1 - discount))) total_price
FROM orders o 
JOIN order_details od ON o.order_id = od.order_id
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY SUM(unit_price * quantity * (1 - discount)) DESC

-- Компании, которые совершили не менее 2 заказов в 1996 году. Сортировка по возрастанию в лексикографическом порядке.
SELECT company_name
FROM customers
WHERE customer_id IN
(SELECT customer_id
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 1996
GROUP BY customer_id
HAVING COUNT(order_id) >= 2)
ORDER BY company_name

-- Количество заказов ежемесячно с 1 апреля по 1 декабря 1997 года включительно
-- и процент изменения заказов по сравнению с предыдущим месяцем
SELECT EXTRACT (MONTH FROM order_date) month_,
COUNT(order_id) orders_count,
ROUND(((COUNT(order_id)::numeric / LAG(COUNT(order_id)) OVER (ORDER BY EXTRACT (MONTH FROM order_date))) - 1) * 100,2) percenatage 
FROM orders
WHERE order_date BETWEEN '1997-04-01' AND '1997-12-01'
GROUP BY EXTRACT (MONTH FROM order_date)

-- процент удержания (retention rate) компаний-заказчиков по месяцам
WITH profiles AS 
(SELECT MIN(DATE_TRUNC('month', order_date::timestamp)) cohort_dt,
customer_id
FROM orders
GROUP BY customer_id),
purchases AS 
(SELECT customer_id,
DATE_TRUNC('month', order_date::timestamp) purchase_date
FROM orders),
purchases_by_date AS 
(SELECT cohort_dt,
purchase_date,
COUNT(DISTINCT(purchases.customer_id)) users_cnt
FROM profiles
JOIN purchases ON profiles.customer_id = purchases.customer_id
GROUP BY cohort_dt, purchase_date)
SELECT *,
MAX (users_cnt) OVER (PARTITION BY cohort_dt),
ROUND(users_cnt::numeric / MAX (users_cnt) OVER (PARTITION BY cohort_dt)::numeric, 4) * 100 retention_rate
FROM purchases_by_date

-- для каждой компании, оформившей хотя бы 2 заказа, вывести дату второго заказа и id компании.
-- сортировка по полю id в лексикографическом порядке по убыванию
WITH orders_by_ids AS
(SELECT DATE_TRUNC('month',order_date)::date date_of_order,
ROW_NUMBER () OVER (PARTITION BY customer_id ORDER BY order_date) rn,
customer_id
FROM orders
WHERE customer_id IN (SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT(order_id)) >=2)
ORDER BY customer_id DESC)
SELECT date_of_order,
customer_id
FROM orders_by_ids
WHERE rn = 2

-- Для каждого месяца с июля 1996 по май 1998 рассчитать конверсию в процентах, 
-- разделив количество уникальных компаний-заказчиков в текущем месяце на общее количество уникальных компаний
-- за всё предыдущее время (включая текущий месяц). Округлить значение до 2-х знаков после запятой.
WITH months AS
(SELECT GENERATE_SERIES(DATE '1996-07-01',
DATE '1998-05-01',
INTERVAL '1 month')::date AS month_),
this_month_customers AS
(SELECT m.month_,
COALESCE(COUNT(customer_id),0) customers_this_month
FROM (SELECT MIN(DATE_TRUNC('month', order_date)::date) first_ts,
customer_id
FROM orders
GROUP BY customer_id) AS first_ts_for_ids
RIGHT JOIN months m ON first_ts_for_ids.first_ts = m.month_
GROUP BY m.month_),
total AS
(SELECT t.month_,
SUM (customers_this_month) OVER (ORDER BY month_) total_customers
FROM this_month_customers t),
month_customers AS
(SELECT DATE_TRUNC('month', order_date)::date month_,
COUNT(DISTINCT(customer_id)) AS customers_this_month
FROM orders
GROUP BY DATE_TRUNC('month', order_date)::date)
SELECT t.month_,
m.customers_this_month,
t.total_customers,
ROUND((m.customers_this_month::real / t.total_customers::real * 100)::numeric,2)
FROM total t 
LEFT JOIN month_customers m ON t.month_ = m.month_