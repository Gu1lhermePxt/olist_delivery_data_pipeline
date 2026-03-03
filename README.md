# Olist Delivery Data Pipeline

## Project Overview

End-to-end analytical data pipeline built using the Brazilian Olist E-Commerce dataset.

This project transforms raw transactional data into an analytics-ready dataset and a dimensional SQL warehouse model, enabling Business Intelligence and Machine Learning use cases.

---

## Objective

Design and implement a complete data pipeline to:

- Process raw e-commerce data
- Engineer delivery performance metrics
- Create an analytics-ready dataset
- Model a dimensional Data Warehouse using Star Schema
- Enable SQL-based analytical queries for BI

---

## Dataset

Source: Brazilian E-Commerce Public Dataset by Olist  
Period: 2016–2018  
Orders: ~100,000  

Main tables used:
- orders
- order_items
- customers
- sellers
- products

---

## Python Analytical Pipeline

### Steps

1. Raw CSV ingestion  
2. Date parsing and null handling  
3. Feature engineering:
   - `delivery_time_days`
4. Filtering only delivered orders  
5. Generation of final analytics dataset  
6. Persistence in Parquet format  

### Core Metric

`delivery_time_days`  
Difference between purchase timestamp and delivery date.

### SLA Analysis

P95 delivery time: **29 days**  
(95% of delivered orders arrive within 29 days)

---

## Data Warehouse Layer (SQL)

A dimensional Data Warehouse was implemented using a Star Schema approach.

### Fact Tables

- `fact_orders`
- `fact_order_items`

### Dimension Tables

- `dim_customer`
- `dim_seller`
- `dim_product`

### Analytical Capabilities

The SQL layer supports:

- Revenue by state  
- Revenue by product category  
- Monthly revenue trends  
- Aggregated KPIs via SQL views  

All SQL scripts are located in the `/sql` directory.

---

## Technical Decisions

- Only `order_status = delivered` considered to avoid skewed metrics  
- Null values were not imputed to preserve statistical integrity  
- Parquet chosen for efficiency and BI/ML compatibility  
- Star Schema adopted for analytical performance and scalability  

---

## Project Structure

data/
├── raw/
├── analytics/

etl/
└── run_pipeline.py

notebooks/
└── 01_exploratory_analysis.ipynb

sql/
├── 01_create_tables.sql
├── 02_insert_data.sql
├── 03_views.sql
└── 04_analytics_queries.sql

README.md

---

## Skills Demonstrated

- Data Cleaning & Transformation
- Feature Engineering
- Analytical Metric Design
- Dimensional Modeling (Star Schema)
- SQL Analytics
- Data Persistence Optimization
- BI-Oriented Data Structuring

---

## Future Improvements

- Orchestration with Airflow
- Deployment on AWS (S3 + RDS)
- Automated testing for pipeline
- Dashboard integration (Power BI / Looker)