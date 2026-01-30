.open fittrackpro.db
.mode column
.headers ON

-- 2.1 
INSERT INTO payments (member_id, amount, payment_date, payment_method, payment_type)
VALUES (11, 50.00, datetime('now'), 'Credit Card', 'Monthly membership fee');
-- Inserts a new payment record for member ID 11 with the specified amount, payment method, payment type and the current date and time

-- 2.2 
SELECT
    strftime('%Y-%m', payment_date) AS month,
    SUM(amount) AS total_revenue
FROM payments
WHERE payment_type = 'Monthly membership fee'
  AND payment_date >= '2024-11-01'
  AND payment_date <  '2025-03-01'
GROUP BY strftime('%Y-%m', payment_date)
ORDER BY month;
-- Calculates total monthly revenue from membership fees between November 2024 and February 2025

-- 2.3 

