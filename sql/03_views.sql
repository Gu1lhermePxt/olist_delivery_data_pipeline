CREATE VIEW vw_revenue_by_state AS
SELECT 
    c.customer_state,
    SUM(oi.price * oi.quantity) AS total_revenue
FROM fact_orders o
JOIN fact_order_items oi
    ON o.order_id = oi.order_id
JOIN dim_customer c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state;