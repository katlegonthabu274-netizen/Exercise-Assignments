-- Databricks notebook source
--QUESTION 1
SELECT order_id, customer_id, order_date,
        DAYNAME(order_date) AS day_name
FROM retail.datefunc.orders;

--QUESTION 2
SELECT customer_id, customer_name, signup_date,
        MONTHNAME(signup_date) AS signup_month_name
FROM retail.datefunc.customer_signups;

--QUESTION 3
SELECT sale_id, product_name, sale_date,
        MONTH(sale_date) AS sale_month
FROM retail.datefunc.sales;
 
--QUESTION 4
SELECT transaction_id, customer_id, transaction_date,
        YEAR(transaction_date) AS tranasction_year
FROM retail.datefunc.transactions;

--QUESTION 5

SELECT delivery_id, `customer_id`, delivery_date,
        DAY(delivery_date) AS day_of_month
FROM retail.datefunc.deliveries;

--QUESTION 6
SELECT employee_id, employee_name, department,
        CURRENT_DATE AS today_date
FROM retail.datefunc.employees;

--QUESTION 7
SELECT order_id, customer_id, order_date_text,
        TO_DATE(order_date_text) AS order_date
FROM retail.datefunc.online_orders;

--QUESTION 8
SELECT payment_id, customer_id, payment_date,
       TO_CHAR (payment_date, 'yyyy-MM-dd') AS formatted_payment_date
FROM retail.datefunc.payment_dates;

--QUESTION 9
SELECT customer_id, customer_name, last_purchase_date,
       DATEDIFF(current_date, last_purchase_date) AS days_since_last_purchase
FROM retail.datefunc.customer_purchases;

--QUESTION 10
SELECT order_id, customer_id, order_date,
       DATE_ADD(to_date(order_date),7) AS expected_delivery_date
FROM retail.datefunc.shipping_orders;

--QUESTION 11
SELECT booking_id, customer_id, booking_date,
       YEAR(booking_date) AS booking_year,
       MONTH(booking_date) AS booking_month,
       DAY(booking_date) AS booking_day
FROM retail.datefunc.bookings;

--QUESTION 12
SELECT order_id, customer_id, order_date, amount,
       YEAR(order_date) AS order_year
FROM retail.datefunc.yearly_orders
WHERE  YEAR(order_date) = 2026;

--QUESTION 13
SELECT order_id, customer_id, order_date, amount,
       MONTH(order_date) AS oder_month
FROM retail.datefunc.monthly_orders
WHERE MONTH(order_date) = 03;

--QUESTION 14
SELECT subscription_id, customer_id, start_date,
       LAST_DAY(start_date) AS month_end_date
FROM retail.datefunc.subscriptions;

--QUESTION 15
SELECT send_id, customer_id, send_date,
       DATE_TRUNC('MONTH', send_date) AS month_start_date
FROM retail.datefunc.campaign_sends;

--QUESTION 16
SELECT invoice_id, customer_id, invoice_date,
       TO_CHAR(invoice_date, 'MMMM yyyy') AS invoice_month_year
FROM retail.datefunc.invoice_dates;

--QUESTION 17
SELECT customer_id, customer_name, date_of_birth,
       DATEDIFF(current_date, date_of_birth) /365 AS customer_age
FROM retail.datefunc.customer_birthdays;

--QUESTION 18
SELECT  order_id, customer_id, order_date,
        DAYNAME(order_date) AS day_name,
CASE 
    WHEN DAYNAME(order_date) IN ('Sun', 'Sat') THEN 'Weekend'
    ELSE 'Weekday'
END AS day_type
FROM retail.datefunc.weekend_orders;

--QUESTION 19
SELECT transaction_id, customer_id, transaction_date, amount,
        QUARTER(transaction_date) AS transaction_quarter
FROM retail.datefunc.quarterly_transactions;

--QUESTION 20
SELECT order_id, customer_id, order_date, amount,
       DATEDIFF(current_date, order_date) AS days_since_order
FROM retail.datefunc.recent_orders
WHERE DATEDIFF(current_date, order_date) > 30;

--BONUS QUESTION
SELECT customer_id, customer_name, last_purchase_date,
       DATEDIFF(current_date, last_purchase_date) AS days_since_last_purchase,
  CASE
      WHEN DATEDIFF(current_date, last_purchase_date) <= 30 THEN "Active Customer"
      WHEN DATEDIFF(current_date, last_purchase_date) BETWEEN 31 AND 90 THEN "At Risk Customer"
      WHEN DATEDIFF(current_date, last_purchase_date) > 90 THEN "Inactive Customer"     
  END AS customer_status
FROM retail.datefunc.customer_recency;
