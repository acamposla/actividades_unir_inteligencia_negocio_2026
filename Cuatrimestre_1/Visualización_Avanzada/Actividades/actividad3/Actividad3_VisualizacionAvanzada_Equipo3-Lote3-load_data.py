import os
import pandas as pd
from sqlalchemy import create_engine, text
from dotenv import load_dotenv
import re

def sanitize_table_name(name):
    """
    Convierte un nombre de hoja de Excel a un nombre de tabla SQL válido.
    Ej: 'Sales Order_data' -> 'sales_order_data'
    """
    # Reemplaza espacios y guiones con underscores
    name = re.sub(r'[\s-]+', '_', name)
    # Elimina el sufijo '_data' si existe
    if name.endswith('_data'):
        name = name[:-5]
    # Convierte a minúsculas
    return name.lower()

def main():
    """
    Función principal para cargar datos de un fichero Excel a una base de datos PostgreSQL.
    """
    # Cargar las variables de entorno desde el fichero .env
    load_dotenv()
    print("Variables de entorno cargadas.")

    # --- 1. Cargar configuración desde variables de entorno ---
    db_host = os.getenv('DB_HOST')
    db_port = os.getenv('DB_PORT')
    db_name = os.getenv('DB_NAME')
    db_user = os.getenv('DB_USER')
    db_password = os.getenv('DB_PASSWORD')

    # Validar que todas las variables necesarias están presentes
    if not all([db_host, db_port, db_name, db_user, db_password]):
        print("Error: Faltan una o más variables de entorno para la conexión a la base de datos.")
        return

    excel_file_path = 'AdventureWorks Sales.xlsx'
    
    # --- 2. Crear la conexión a la base de datos usando SQLAlchemy ---
    # SQLAlchemy es una librería ORM que facilita la interacción con bases de datos.
    # La cadena de conexión sigue un formato estándar: postgresql://user:password@host:port/dbname
    connection_string = f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
    
    # Añadimos parámetros SSL para asegurar la conexión. DigitalOcean lo requiere.
    engine = create_engine(
        connection_string,
        connect_args={'sslmode': 'require'}
    )
    
    print(f"Conectando a la base de datos en {db_host}...")

    try:
        # --- 3. Probar la conexión ---
        with engine.connect() as connection:
            result = connection.execute(text("SELECT 1"))
            print("Conexión a la base de datos establecida con éxito.")

        # --- 4. Cargar el fichero Excel y procesar cada hoja ---
        xls = pd.ExcelFile(excel_file_path)
        sheet_names = xls.sheet_names
        print(f"Fichero Excel '{excel_file_path}' cargado. Hojas encontradas: {sheet_names}")

        for sheet_name in sheet_names:
            table_name = sanitize_table_name(sheet_name)
            print(f"\nProcesando hoja: '{sheet_name}' -> Tabla: '{table_name}'")

            # Leer la hoja actual en un DataFrame de pandas
            df = pd.read_excel(xls, sheet_name=sheet_name)
            print(f"Leídas {len(df)} filas.")

            # Usar df.to_sql para cargar el DataFrame en la base de datos
            # 'if_exists='replace'' borrará y reemplazará la tabla si ya existe.
            # Esto es útil durante el desarrollo para poder re-ejecutar el script.
            df.to_sql(
                table_name,
                engine,
                if_exists='replace',
                index=False,
                schema='public' # Usar el esquema público por defecto en PostgreSQL
            )
            print(f"Tabla '{table_name}' cargada/reemplazada con éxito en la base de datos.")

        print("\nProceso completado. Todas las hojas han sido cargadas a la base de datos.")

    except Exception as e:
        print(f"Ha ocurrido un error: {e}")
        print("Por favor, verifique sus credenciales, la conexión de red y si la base de datos está accesible.")

    finally:
        # Cerrar todas las conexiones del pool de SQLAlchemy
        if 'engine' in locals():
            engine.dispose()
            print("\nConexiones a la base de datos cerradas.")

if __name__ == '__main__':
    main()
