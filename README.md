# Olist Delivery Data Pipeline

## Overview

Production-style end-to-end data pipeline built using the Brazilian Olist E-Commerce dataset (~100k orders).

This project transforms raw transactional data into:

- An analytics-ready dataset (Parquet)
- A dimensional Data Warehouse (Star Schema)
- SQL-powered analytical layer for Business Intelligence

The pipeline demonstrates real-world data engineering practices applied to e-commerce delivery analytics.

---

## Architecture

Raw CSV Data  
→ Python ETL (Cleaning + Feature Engineering)  
→ Analytics Dataset (Parquet)  
→ Dimensional Modeling (Star Schema)  
→ SQL Analytics Layer (Views & KPIs)

---

## Business Objective

Design a scalable data pipeline capable of:

- Measuring delivery performance
- Identifying SLA behavior
- Enabling revenue and logistics analysis
- Supporting BI dashboards and ML applications

---

## Key Analytical Metric

### delivery_time_days

Calculated as:

delivery_date - purchase_timestamp

### SLA Insight

P95 Delivery Time: 29 days  
Meaning 95% of delivered orders arrive within 29 days.

This metric enables logistics performance monitoring and SLA validation.

---

## Data Warehouse Model

Star Schema implemented for analytical performance.

### Fact Tables
- fact_orders
- fact_order_items

### Dimension Tables
- dim_customer
- dim_seller
- dim_product

Designed for:

- Revenue by state  
- Revenue by product category  
- Monthly revenue trends  
- Aggregated KPIs  

All SQL scripts are available in `/sql`.

---

## Technical Stack

- Python (Pandas)
- SQL
- Parquet
- Dimensional Modeling
- Star Schema
- Jupyter Notebook

---

## Engineering Decisions

- Only delivered orders included to prevent skewed SLA metrics  
- No null imputation to preserve statistical integrity  
- Parquet format chosen for analytical efficiency  
- Star Schema adopted for BI scalability  

---

## How to Run

1. Place raw CSV files inside `data/raw/`
2. Execute:

```bash
python etl/run_pipeline.py
```

3. Output dataset will be generated in `data/analytics/`

---

## Project Structure

```
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
```

---

## Skills Demonstrated

- ETL Development  
- Feature Engineering  
- Analytical Metric Design  
- Data Warehouse Modeling  
- SQL-Based KPI Design  
- Data Optimization (Parquet)  
- BI-Oriented Structuring  

---

## Future Improvements

- Orchestration with Apache Airflow  
- Deployment on AWS (S3 + RDS)  
- CI/CD for pipeline validation  
- Dashboard integration (Power BI / Looker)  
