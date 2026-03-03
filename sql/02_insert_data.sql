INSERT INTO dim_customer VALUES
('cust_2','Sao Paulo','SP'),
('cust_3','Belo Horizonte','MG'),
('cust_4','Fortaleza','CE'),
('cust_5','Recife','PE'),
('cust_6','Porto Alegre','RS');

INSERT INTO dim_seller VALUES
('seller_2','Curitiba','PR'),
('seller_3','Salvador','BA'),
('seller_4','Brasília','DF'),
('seller_5','Manaus','AM');

INSERT INTO dim_product VALUES
('prod_2','books'),
('prod_3','computers'),
('prod_4','furniture'),
('prod_5','clothing'),
('prod_6','sports'),
('prod_7','electronics'),
('prod_8','books');

INSERT INTO fact_orders VALUES
('order_20','cust_2','seller_2','2025-04-01','2025-04-05',4),
('order_30','cust_2','seller_2','2025-04-10','2025-04-15',5),
('order_31','cust_3','seller_3','2025-04-12','2025-04-18',6),
('order_32','cust_4','seller_4','2025-05-01','2025-05-05',4),
('order_33','cust_5','seller_5','2025-05-03','2025-05-10',7),
('order_34','cust_6','seller_2','2025-06-01','2025-06-04',3);

INSERT INTO fact_order_items VALUES
('order_20','prod_3',1,2000.00,50.00),
('order_20','prod_2',2,50.00,10.00),

('order_30','prod_3',1,2100.00,60.00),
('order_30','prod_2',3,55.00,15.00),

('order_31','prod_5',4,120.00,25.00),
('order_31','prod_3',1,130.00,20.00),

('order_32','prod_4',1,900.00,80.00),
('order_32','prod_6',2,300.00,40.00),

('order_33','prod_7',2,1500.00,70.00),
('order_33','prod_8',5,60.00,20.00),

('order_34','prod_3',1,2200.00,65.00),
('order_34','prod_5',3,110.00,30.00);