-- E-commerce Sales Analysis
-- SQL-анализ продаж интернет-магазина
-- PostgreSQL

-- 1. Общая выручка магазина по завершенным заказам
SELECT
    SUM(p.price * oi.quantity) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'completed';

-- 2. Выручка по месяцам
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(p.price * oi.quantity) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'completed'
GROUP BY month
ORDER BY month;

-- 3. Топ-5 товаров по выручке
SELECT
    p.product_name,
    SUM(p.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- 4. Средний чек заказа
SELECT
    ROUND(
        SUM(p.price * oi.quantity) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'completed';

-- 5. Количество заказов по месяцам
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS orders_count
FROM orders o
WHERE o.status = 'completed'
GROUP BY month
ORDER BY month;

-- 6. Топ-5 клиентов по сумме покупок
SELECT
    c.customer_id,
    c.city,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.city
ORDER BY total_spent DESC
LIMIT 5;

-- 7. Доля отменённых заказов
SELECT
    COUNT(*) FILTER (WHERE status = 'cancelled') AS cancelled_orders,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) FILTER (WHERE status = 'cancelled') * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM orders;