# Olist Delivery Data Pipeline

##  Objetivo
Construir um pipeline analítico a partir de dados brutos de e-commerce
para analisar o tempo de entrega dos pedidos e gerar uma tabela pronta
para BI e Machine Learning.

##  Dataset
- Fonte: Brazilian E-Commerce Public Dataset by Olist
- Período: 2016–2018
- Total de pedidos: ~100k

##  Pipeline
1. Leitura de dados brutos (CSV)
2. Tratamento de datas e valores nulos
3. Criação da métrica `delivery_time_days`
4. Filtragem apenas de pedidos entregues
5. Geração de tabela analítica final
6. Persistência em formato Parquet

##  Métrica principal
- **delivery_time_days**: diferença entre a data de compra e a data de entrega

### SLA
- P95 (95% dos pedidos entregues): **29 dias**

##  Decisões técnicas
- Apenas pedidos com `order_status = delivered` foram considerados
- Valores nulos não foram imputados para evitar distorção de métricas
- Parquet escolhido por eficiência e compatibilidade com BI/ML

##  Estrutura do projeto

```
data/
├── raw/
│   └── olist_orders_dataset.csv
│   └── olist_order_items_dataset.csv
│   └── ...
├── analytics/
│   └── orders_delivery_analytics.parquet
notebooks/
└── 01_exploratory_analysis.ipynb
etl/
└── run_pipeline.py
README.md
```