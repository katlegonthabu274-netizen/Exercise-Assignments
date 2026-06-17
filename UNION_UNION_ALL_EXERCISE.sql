-- Databricks notebook source

--QUESTION 1
SELECT account_id, account_holder, 'Sandton' AS city
FROM retail.banking.branch_sandton_acccounts
UNION
SELECT account_id, account_holder, 'Rosebank' As city
FROM retail.banking.branch_rosebank_accounts;

--ATLERNATIVE LOGIC QUESTION 1
WITH combined AS 
               (SELECT account_id, account_holder, 'Sandton' AS city
               FROM retail.banking.branch_sandton_acccounts
               UNION
               SELECT account_id, account_holder, 'Rosebank' As city
               FROM retail.banking.branch_rosebank_accounts) 
   SELECT account_id, account_holder, city
   FROM ( SELECT *,
                  ROW_NUMBER() OVER (PARTITION BY account_id
                  ORDER BY city) AS rn
         FROM combined)
   WHERE rn =1;

--QUESTION 2
SELECT product_code, product_name, 
       CASE 
          WHEN product_name ILIKE '%current%' THEN 'current_account'
          ELSE 'savings_account'
       END AS product_type
FROM retail.banking.savings_products
UNION
SELECT product_code, product_name, 
       CASE 
          WHEN product_name ILIKE '%savings%' THEN 'savings_account'
          ELSE 'current_account'
       END AS product_type
FROM retail.banking.current_products;

--QUESTION 3
SELECT staff_id, staff_name
FROM retail.banking.retail_banking_staff
UNION
SELECT staff_id, staff_name
FROM retail.banking.corporate_banking_staff;

--QUESTION 4
SELECT city_code, city_name,
      CASE 
          WHEN city_name ILIKE '%mobile%' THEN 'mobile_branch'
          ELSE 'digital_branch'
       END AS region
FROM retail.banking.mobile_branch_cities
UNION
SELECT city_code, city_name,
      CASE 
          WHEN city_name ILIKE '%digital%' THEN 'digital_branch'
          ELSE 'mobile_branch'
       END AS region
FROM retail.banking.digital_branch_cities;
   
--QUESTION 5
SELECT customer_id, customer_name,
      CASE 
          WHEN customer_id ILIKE '%push%' THEN 'push_notification'
          ELSE 'inapp_banner'
       END AS segment
FROM retail.banking.push_notification_targets
UNION
SELECT customer_id, customer_name,
      CASE 
          WHEN customer_id ILIKE '%inapp%' THEN 'inapp_banner'
          ELSE 'push_notification'
       END AS segment
FROM retail.banking.inapp_banner_targets;



--QUESTION 6
SELECT transaction_id, account_id, amount
FROM retail.banking.atm_01_transactions
UNION ALL
SELECT transaction_id, account_id, amount
FROM retail.banking.atm_02_transactions;

--QUESTION 7
SELECT app_id, customer_id, loan_type
FROM retail.banking.gauteng_loan_applications
UNION ALL
SELECT app_id, customer_id, loan_type
FROM retail.banking.western_cape_loan_applications;

--QUESTION 8
SELECT complaint_id, customer_id,
      CASE
          WHEN complaint_id ILIKE '%email%' THEN 'email_complaints'
          ELSE 'app_complaints'
          END AS category
FROM retail.banking.email_complaints
UNION ALL
SELECT complaint_id, customer_id,
       CASE
           WHEN complaint_id ILIKE '%app%' THEN 'app_complaints'
           ELSE 'email_complaints'
           END AS category
FROM retail.banking.app_complaints;

--QUESTION 9
SELECT payment_id, account_id, amount, 'April' AS payment_date
FROM retail.banking.april_payments
UNION ALL
SELECT payment_id, account_id, amount, 'May' AS payment_date
FROM retail.banking.may_payments;

--QUESTION 10
SELECT entry_id, account_id, entry_type
FROM retail.banking.debit_entries
UNION ALL
SELECT entry_id, account_id, entry_type
FROM retail.banking.credit_entries;



