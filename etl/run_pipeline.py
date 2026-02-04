import os
import pandas as pd

RAW_PATH = "../data/raw"
ANALYTICS_PATH = "../data/analytics"

def load_orders():
    orders = pd.read_csv(f"{RAW_PATH}/olist_orders_dataset.csv")

    return orders

def transform_orders(orders: pd.DataFrame) -> pd.DataFrame:
    date_cols = [
        "order_purchase_timestamp"
        "order_aproved_at"
        "order_delivered_carrier_date"
        "order_delivered_customer_date"
        "order_estimated_delivery_date"
    ]

    for col in date_cols:
        orders[col] = pd.to_datetime(orders[col], errors= "coerce")

    delivered_orders = orders[orders["order_status"] == "delivered"].copy()

    delivered_orders["delivery_time_days"] = (
        delivered_orders["order_delivered_customer_date"]
        - delivered_orders["order_purchase_timestamp"]    
    ).dt.days 

    analytics_orders = delivered_orders[
        [
            "order_id",
            "customer_id",
            "order_purchase_timestamp"
            "order_delivered_customer_date"
            "delivery_time_days"
        ]
    ] 

    return analytics_orders


def save_analytics(df: pd.DataFrame):
    os.makedirs(ANALYTICS_PATH, exist_ok=True)

    output_path = f"{ANALYTICS_PATH}/orders_delivery_analytics.parquet"
    df.to_parquet(output_path, index=False)

    print(f"Analytics dataset saved at: {output_path}")


def main():
    print("Starting delivery analytics pipeline")

    orders = load_orders()
    analytics_orders = transform_orders(orders)
    save_analytics(analytics_orders)

    print("Pipeline finished successufully")

    if __name__ == "__main__":
        main()
