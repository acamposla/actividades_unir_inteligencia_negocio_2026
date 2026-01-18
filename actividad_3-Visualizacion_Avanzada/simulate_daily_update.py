import os
import pandas as pd
import numpy as np
from sqlalchemy import create_engine, text
from dotenv import load_dotenv
import datetime
import re

def main():
    """
    Función para simular la adición de nuevas ventas diarias a la base de datos,
    respetando el esquema en estrella y la integridad referencial.
    """
    load_dotenv()
    print("Iniciando simulación de actualización diaria (v2)...")

    db_host = os.getenv('DB_HOST')
    db_port = os.getenv('DB_PORT')
    db_name = os.getenv('DB_NAME')
    db_user = os.getenv('DB_USER')
    db_password = os.getenv('DB_PASSWORD')

    if not all([db_host, db_port, db_name, db_user, db_password]):
        print("Error: Faltan variables de entorno.")
        return
        
    connection_string = f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
    engine = create_engine(connection_string, connect_args={'sslmode': 'require'})

    print("Conectado a la base de datos.")

    try:
        with engine.connect() as connection:
            
            # --- 1. Encontrar la última fecha de orden REAL ---
            # Para ello, unimos la tabla de hechos (sales) con la dimensión (date)
            last_order_date_query = text("""
                SELECT T2."Date"
                FROM sales AS T1
                JOIN date AS T2 ON T1."OrderDateKey" = T2."DateKey"
                ORDER BY T2."Date" DESC
                LIMIT 1;
            """)
            last_order_date_result = connection.execute(last_order_date_query).scalar()
            
            if not last_order_date_result:
                print("No se encontraron datos en la tabla 'sales'. Ejecute `load_data.py` primero.")
                return

            new_order_date = last_order_date_result.date() + datetime.timedelta(days=1)
            print(f"Última fecha de orden encontrada: {last_order_date_result.date()}. Nuevas órdenes se crearán para: {new_order_date}")

            # --- 2. Obtener la DateKey para el nuevo día ---
            new_date_key_query = text('SELECT "DateKey" FROM date WHERE "Date" = :new_date')
            new_date_key = connection.execute(new_date_key_query, {'new_date': new_order_date}).scalar()

            if not new_date_key:
                print(f"Error: No se encontró una 'DateKey' para la fecha {new_order_date} en la tabla 'date'.")
                print("Asegúrese de que su tabla de dimensión de fechas contenga fechas futuras.")
                return

            print(f"La 'DateKey' para el nuevo día es: {new_date_key}")

            # --- 3. Obtener claves válidas y claves para incrementar ---
            customer_keys = pd.read_sql('SELECT "CustomerKey" FROM customer', connection)['CustomerKey'].tolist()
            product_keys = pd.read_sql('SELECT "ProductKey" FROM product', connection)['ProductKey'].tolist()
            territory_keys = pd.read_sql('SELECT "SalesTerritoryKey" FROM sales_territory', connection)['SalesTerritoryKey'].tolist()
            
            max_line_key = connection.execute(text('SELECT MAX("SalesOrderLineKey") FROM sales')).scalar() or 0
            
            # --- 4. Generar N nuevas órdenes de venta ---
            num_new_orders = np.random.randint(5, 15)
            new_sales_data = []
            print(f"Generando {num_new_orders} nuevas órdenes de venta...")

            for i in range(num_new_orders):
                # Las columnas del DataFrame DEBEN coincidir con las de la tabla SQL, incluyendo espacios.
                new_sales_data.append({
                    'SalesOrderLineKey': max_line_key + i + 1,
                    'ResellerKey': np.random.randint(1, 700), # Simplificación
                    'CustomerKey': np.random.choice(customer_keys),
                    'ProductKey': np.random.choice(product_keys),
                    'OrderDateKey': new_date_key,
                    'DueDateKey': new_date_key, # Simplificación
                    'ShipDateKey': new_date_key, # Simplificación
                    'SalesTerritoryKey': np.random.choice(territory_keys),
                    'Order Quantity': np.random.randint(1, 5),
                    'Unit Price': np.random.uniform(5, 2500),
                    'Extended Amount': 0, # Se calcularía en un entorno real
                    'Unit Price Discount Pct': 0,
                    'Product Standard Cost': 0,
                    'Total Product Cost': 0,
                    'Sales Amount': np.random.uniform(100, 5000) # Simplificación
                })

            new_sales_df = pd.DataFrame(new_sales_data)
            
            # --- 5. Insertar los nuevos datos en la base de datos ---
            new_sales_df.to_sql(
                'sales',
                engine,
                if_exists='append',
                index=False
            )
            print(f"\n{len(new_sales_df)} nuevas filas insertadas con éxito en la tabla 'sales'.")

    except Exception as e:
        print(f"Ha ocurrido un error durante la simulación: {e}")

    finally:
        engine.dispose()
        print("Simulación finalizada. Conexión a la base de datos cerrada.")

if __name__ == '__main__':
    main()