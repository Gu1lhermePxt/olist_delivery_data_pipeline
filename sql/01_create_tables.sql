CREATE TABLE dim_customer (
	customer_id VARCHAR(50) PRIMARY KEY,
	customer_city VARCHAR(100),
	customer_state VARCHAR(2)
);

CREATE TABLE dim_seller (
	seller_id VARCHAR(50) PRIMARY KEY,
	seller_city VARCHAR(100),
	seller_state VARCHAR(2)
);

CREATE TABLE dim_product (
	product_id VARCHAR(50) PRIMARY KEY,
	product_category VARCHAR(100)
);

CREATE TABLE dim_date (
	date_id SERIAL PRIMARY KEY,
	full_date DATE UNIQUE,
	year INT,
	month INT,
	day INT,
	day_of_week VARCHAR(10)
);

CREATE TABLE fact_orders (
	order_id VARCHAR(50) PRIMARY KEY,
	customer_id VARCHAR(50),
	seller_id VARCHAR(50),
	product_id VARCHAR(50),
	purchase_date DATE,
	delivery_date DATE,
	delivery_time_days INT,
	price NUMERIC (10,2),
	freight_value NUMERIC(10,2),

	FOREIGN KEY (cus)
);


INSERT INTO dim_customer VALUES
('cust_2','Sao Paulo','SP'),
('cust_3','Belo Horizonte','MG');

INSERT INTO dim_seller VALUES
('seller_2','Curitiba','PR'),
('seller_3','Salvador','BA');

INSERT INTO dim_product VALUES
('prod_2','books'),
('prod_3','computers');

INSERT INTO fact_orders VALUES
('order_2','cust_2','seller_1','prod_2','2025-01-02','2025-01-06',4,50.00,10.00),
('order_3','cust_3','seller_2','prod_3','2025-02-01','2025-02-05',4,2000.00,50.00),
('order_4','cust_1','seller_3','prod_1','2025-02-10','2025-02-12',2,120.00,15.00),
('order_5','cust_2','seller_2','prod_3','2025-03-01','2025-03-05',4,1800.00,40.00);

SELECT 
    p.product_category,
    SUM(f.price) AS total_revenue
FROM fact_orders f
JOIN dim_product p 
    ON f.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC;



SELECT 
    c.customer_state,
    SUM(f.price) AS total_revenue
FROM fact_orders f
JOIN dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;


SELECT 
    DATE_TRUNC('month', purchase_date) AS month,
    SUM(price) AS total_revenue
FROM fact_orders
GROUP BY month
ORDER BY month;


DROP TABLE fact_orders;



CREATE TABLE fact_orders(
	order_id VARCHAR(50) PRIMARY KEY,
	customer_id VARCHAR(50),
	seller_id VARCHAR(50),
	purchase_date DATE,
	delivery_date DATE,
	delivery_time_days INT,

	FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
	FOREIGN KEY (seller_id) REFERENCES dim_seller(seller_id)
);


CREATE TABLE fact_order_items (
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity INT,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2),

    PRIMARY KEY (order_id, product_id),

    FOREIGN KEY (order_id) REFERENCES fact_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);
	

INSERT INTO fact_orders VALUES
('order_20','cust_1','seller_1','2025-04-01','2025-04-05',4);

INSERT INTO fact_order_items VALUES
('order_20','prod_1',1,100.00,20.00),
('order_20','prod_2',2,50.00,10.00);

SELECT 
    SUM(oi.price * oi.quantity) AS total_revenue
FROM fact_order_items oi;



SELECT 
    p.product_category,
    SUM(oi.price * oi.quantity) AS total_revenue
FROM fact_order_items oi
JOIN dim_product p
    ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC;



SELECT 
    c.customer_state,
    SUM(oi.price * oi.quantity) AS total_revenue
FROM fact_orders o
JOIN fact_order_items oi
    ON o.order_id = oi.order_id
JOIN dim_customer c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;



SELECT 
    DATE_TRUNC('month', o.purchase_date) AS month,
    SUM(oi.price * oi.quantity) AS total_revenue
FROM fact_orders o
JOIN fact_order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;



INSERT INTO dim_product VALUES
('prod_4', 'furniture'),
('prod_5', 'clothing'),
('prod_6', 'sports'),
('prod_7', 'electronics'),
('prod_8', 'books');




INSERT INTO dim_customer VALUES
('cust_4', 'Fortaleza', 'CE'),
('cust_5', 'Recife', 'PE'),
('cust_6', 'Porto Alegre', 'RS');



INSERT INTO dim_seller VALUES
('seller_4', 'Brasília', 'DF'),
('seller_5', 'Manaus', 'AM');




INSERT INTO fact_orders VALUES
('order_30','cust_2','seller_2','2025-04-10','2025-04-15',5),
('order_31','cust_3','seller_3','2025-04-12','2025-04-18',6),
('order_32','cust_4','seller_4','2025-05-01','2025-05-05',4),
('order_33','cust_5','seller_5','2025-05-03','2025-05-10',7),
('order_34','cust_6','seller_1','2025-06-01','2025-06-04',3);




INSERT INTO fact_order_items VALUES
('order_30','prod_3',1,2100.00,60.00),
('order_30','prod_2',3,55.00,15.00),

('order_31','prod_5',4,120.00,25.00),
('order_31','prod_1',1,130.00,20.00),

('order_32','prod_4',1,900.00,80.00),
('order_32','prod_6',2,300.00,40.00),

('order_33','prod_7',2,1500.00,70.00),
('order_33','prod_8',5,60.00,20.00),

('order_34','prod_3',1,2200.00,65.00),
('order_34','prod_5',3,110.00,30.00);




SELECT SUM(price * quantity)
FROM fact_order_items;



SELECT 
    p.product_category,
    SUM(oi.price * oi.quantity) AS total_revenue
FROM fact_order_items oi
JOIN dim_product p
    ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC;


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


SELECT * FROM vw_revenue_by_state
ORDER BY total_revenue DESC;


SELECT * FROM vw_revenue_by_state;