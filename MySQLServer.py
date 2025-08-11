#!/usr/bin/env python3
"""
This script connects to a MySQL server and creates a database if it does not exist.
"""

import mysql.connector
from dotenv import load_dotenv
import os

load_dotenv()

db_to_create = "alx_book_store"
try:
    conn = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        port=os.getenv("DB_PORT"),
    )
    cursor = conn.cursor()
    sql = """CREATE DATABASE IF NOT EXISTS { db_to_create }"""
    cursor.execute(sql)
    print(f"Database '{db_to_create}' created successfully.")
except mysql.connector.Error as e:
    print(f"Missing environment variable: {e}")

finally:
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals() and conn.is_connected():
        conn.close()
        print("Connection closed.")
