-- Databricks notebook source
SELECT * FROM retail.default.plans;
SELECT * FROM retail.default.shows;
SELECT * FROM retail.default.subscriptions;
SELECT * FROM retail.default.users;
SELECT * FROM retail.default.viewing_sessions;

--PART A-INNER JOIN
--QUESTION 1
SELECT u.user_id, u.user_name, s.subscription_id, s.start_date
FROM retail.default.users u
INNER JOIN retail.default.subscriptions s
ON u.user_id= s.user_id;

--QUESTION 2
SELECT s.subscription_id, s.user_id, p.plan_name, p.monthly_price
FROM retail.default.subscriptions s
INNER JOIN retail.default.plans p
ON s.plan_id= p.plan_id;

--QUESTION 3
SELECT v.session_id, v.user_id,s.show_title, s.genre, v.watch_minutes
FROM retail.default.viewing_sessions v
INNER JOIN retail.default.shows s
ON v.show_id= s.show_id; 

--QUESTION 4
SELECT u.user_name, u.country, v.session_id,v.show_id, v.watch_minutes
FROM retail.default.viewing_sessions v
INNER JOIN retail.default.users u
ON v.user_id= u.user_id;

--QUESTION 5
SELECT u.user_name, u.country, p.plan_name, p.monthly_price, s.start_date
FROM retail.default.users u
INNER JOIN retail.default.subscriptions s
ON u.user_id= s.user_id 
INNER JOIN retail.default.plans p
ON p.plan_id= s.plan_id;

--PARTB- LEFT JOIN
--QUESTION 6
SELECT u.user_id, u.user_name, s.subscription_id, s.start_date
FROM retail.default.users u
LEFT JOIN retail.default.subscriptions s
ON u.user_id= s.user_id;

--QUESTION 7
SELECT p.plan_id, p.plan_name, s.subscription_id, s.user_id
FROM retail.default.plans p
LEFT JOIN retail.default.subscriptions s
ON p.plan_id=s.plan_id;

--QUESTION 8
SELECT s.show_id, s.show_title, v.session_id, v.watch_minutes
FROM retail.default.shows s
LEFT JOIN retail.default.viewing_sessions v
ON s.show_id= v.show_id;

--QUESTION 9
SELECT v.session_id, v.show_id, v.watch_minutes, u.user_id, u.user_name
FROM retail.default.viewing_sessions v
LEFT JOIN retail.default.users u
ON v.user_id= u.user_id;

--QUESTION 10
SELECT u.user_name, u.country, p.plan_name, p.monthly_price
FROM retail.default.users u
LEFT JOIN retail.default.subscriptions s
ON u.user_id= s.user_id
LEFT JOIN retail.default.plans p
ON p.plan_id= s.plan_id;

--QUESTION 11
SELECT u.user_id, u.user_name, s.subscription_id, s.start_date
FROM retail.default.users u
FULL OUTER JOIN retail.default.subscriptions s
ON u.user_id=s.user_id;

--QUESTION 12
SELECT p.plan_id, p.plan_name, s.subscription_id, s.user_id
FROM retail.default.plans p
FULL OUTER JOIN retail.default.subscriptions s
ON p.plan_id= s.plan_id;

--QUESTION 13
SELECT s.show_id, s.show_title, v.session_id, v.watch_minutes
FROM retail.default.shows s
FULL OUTER JOIN retail.default.viewing_sessions v
ON s.show_id= v.show_id;

--QUESTION 14
SELECT u.user_id, u.user_name, v.session_id, v.show_id, v.watch_minutes
FROM retail.default.users u
FULL OUTER JOIN retail.default.viewing_sessions v
ON u.user_id= v.user_id;

--QUESTION 15
--I intially used the standard SQL syntax as in QUESTION 14 but the results returned with duplications and subscriptions that do not exist in relation to the matching columns. 
--I searched for ways to clean the results without losing the necessary results by using the COALESCE FUNCTION
--The COALESCE FUNCTION merged the matching columns and removed the incorrect results.
SELECT COALESCE(u.user_id,s.user_id) AS user_id,
        u.user_name,
        COALESCE(s.plan_id, p.plan_id) AS plan_id,
        p.plan_name,
        s.subscription_id
FROM retail.default.users u
FULL OUTER JOIN retail.default.subscriptions s
ON u.user_id= s.user_id
FULL OUTER JOIN retail.default.plans p
ON s.plan_id= p.plan_id;
