import pandas as pd
import sqlite3

database = 'dataabase.db'
conn = sqlite3.connect(database)

tables = pd.read_sql("""SELECT * FROM sqlite_master
                     WHERE type = 'table';""", conn)
print(tables)

customer = pd.read_sql("""SELECT * FROM customer;""", conn)
print(customer, '\n')

salesman = pd.read_sql("""SELECT * FROM salesman;""", conn)
print(salesman, '\n')

print(pd.read_sql("""SELECT customer.cust_name, salesman.name, salesman.city FROM salesman
                  LEFT JOIN CUSTOMER
                  ON customer.city = salesman.city;""", conn))

