USE Dashdine_DB;

-- Section uses SQL to answer business questions for insight into the business

-- 1. Total spend per customer
SELECT 
	c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
	ON  c.customer_id = o.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
;


-- 2. Top restaurant by revenue
SELECT 
	r.restaurant_id,
    r.restaurant_name,
    SUM(o.total_amount) AS total_amount
FROM orders o
JOIN restaurants r
	ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY total_amount DESC
LIMIT 1
;

-- 3. Who are our top 5 customers by lifetime value?
SELECT
	c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(o.total_amount) As lifetime_value
FROM customers c
JOIN orders o
	ON c.customer_id = o.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY lifetime_value DESC
LIMIT 5
;

-- 4. Which menu items generate the most revenue?
SELECT
	mi.item_name,
    SUM(oi.quantity * oi.item_price) AS total_revenue
FROM order_items oi
JOIN menu_items mi
	ON oi.item_id = mi.item_id
GROUP BY mi.item_name
ORDER BY total_revenue DESC
LIMIT 3
;

-- 5. Average delivery time per driver
SELECT
	d.driver_id,
    CONCAT(d.first_name,' ',d.last_name) AS Driver_Name,
	AVG(TIMESTAMPDIFF(MINUTE,pickup_time, delivery_time)) AS avg_delivery
FROM  deliveries del
JOIN drivers d 
	ON del.driver_id = d.driver_id
WHERE delivery_time IS NOT NULL
GROUP BY d.driver_id, driver_name
;

-- 6. Which restaurants have the slowest deliveries?
-- Goal to help operations team fix any bottlenecks.
SELECT
	r.restaurant_name,
    AVG(TIMESTAMPDIFF(MINUTE, del.pickup_time, del.delivery_time)) AS avg_delivery_times
FROM deliveries del
JOIN orders o
	ON del.order_id = o.order_id
JOIN restaurants r
	ON o.restaurant_id = r.restaurant_id
WHERE del.delivery_time IS NOT NULL
GROUP BY r.restaurant_name
ORDER BY avg_delivery_times DESC
;

-- 6. Payment method distribution
-- Use this data optimize payment fees

SELECT 
	payment_method,
    COUNT(payment_method) AS total_payments,
    SUM(paid_amount) AS total_amount
FROM payments 
WHERE payment_status = 'Completed'
GROUP BY payment_method
;

-- 7. Daily revenue trend

SELECT
	DATE(order_date) AS order_day,
    SUM(total_amount) AS daily_revenue
FROM Orders
GROUP BY order_day
ORDER BY order_day
;




