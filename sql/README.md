# Olist Delivery Data Pipeline (SQL Data Warehouse Project)

##  Project Overview

This project simulates a **Data Warehouse environment** for an e-commerce delivery platform inspired by the Brazilian Olist dataset.

The goal is to model transactional data using a **dimensional model (Star Schema)** and generate business insights through SQL analytics queries.

---

## Data Modeling

The database was designed using a **Star Schema approach**, separating:

* **Fact Tables** (transactional data)
* **Dimension Tables** (descriptive data)

### Fact Tables

* `fact_orders`
* `fact_order_items`

### Dimension Tables

* `dim_customer`
* `dim_seller`
* `dim_product`

This structure improves:

* Query performance
* Analytical flexibility
* Business intelligence capability

---

## Project Structure

```
olist_delivery_data_pipeline/
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_views.sql
│   └── 04_analytics_queries.sql
│
└── README.md
```

---

## Business Questions Answered

This project answers key business questions such as:

* What is the total revenue?
* Which product categories generate the most revenue?
* Which states generate the highest sales?
* How does revenue evolve month over month?

---

##  Analytical Features

### Revenue by Category

Aggregates total revenue per product category.

### Revenue by State

Implemented through a SQL View:

```
vw_revenue_by_state
```

### Monthly Revenue Trend

Uses `DATE_TRUNC` to analyze time-based revenue growth.

---

## Technologies Used

* PostgreSQL
* SQL
* Dimensional Modeling
* Aggregation & Analytical Queries

---

##  How to Run

1. Execute `01_create_tables.sql`
2. Execute `02_insert_data.sql`
3. Execute `03_views.sql`
4. Run analytical queries from `04_analytics_queries.sql`

---

## Skills Demonstrated

* Data Modeling (Star Schema)
* Fact vs Dimension separation
* Primary & Foreign Keys
* Aggregations and Joins
* View creation
* Business-oriented SQL analysis

---

## Project Purpose

This project was developed as part of my Data Engineering and Data Analytics learning journey, focusing on building a structured analytical environment from scratch using SQL.

---

## Author

Guilherme Peixoto Duarte
Data Engineering & Data Science Student
