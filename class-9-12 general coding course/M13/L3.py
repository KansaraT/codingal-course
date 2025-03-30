import pandas as pd
import sqlite3

database = 'dataabase.db'
conn = sqlite3.connect(database)

tables = pd.read_sql("""SELECT * FROM sqlite_master
                     WHERE type = 'table';""", conn)
print(tables)

customer = pd.read_sql("""SELECT * FROM customer;""", conn)
print(customer,'\n')
print(customer.dtypes, '\n')

customer = pd.read_sql("""SELECT cust_name, city, COUNT(city) AS city_count FROM customer 
                    GROUP BY city;""", conn)
print(customer, '\n')

customer = pd.read_sql("""SELECT * FROM customer 
                    ORDER BY Salesman_id DESC;""", conn)
print(customer)

