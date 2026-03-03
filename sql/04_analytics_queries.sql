-- Total Revenue
SELECT SUM(price * quantity) AS total_revenue
FROM fact_order_items;

-- Revenue by Category
SELECT 
    p.product_category,
    SUM(oi.price * oi.quantity) AS total_revenue
FROM fact_order_items oi
JOIN dim_product p
    ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC;

-- Revenue by Month
SELECT 
    DATE_TRUNC('month', o.purchase_date) AS month,
    SUM(oi.price * oi.quantity) AS total_revenue
FROM fact_orders o
JOIN fact_order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Revenue by State (using View)
SELECT * 
FROM vw_revenue_by_state
ORDER BY total_revenue DESC;