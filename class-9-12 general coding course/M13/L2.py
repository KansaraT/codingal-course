import pandas as pd
import sqlite3

database = 'dataabase.db'
conn = sqlite3.connect(database)

#read sql query for getting all the tables of database into a dataframe


tables = pd.read_sql("""SELECT * 
                    FROM sqlite_master
                    WHERE type = 'table'
                    ;""", conn)

print(tables)

df = pd.read_sql("""SELECT * FROM Salesman""", conn)
print(df)

df1 = pd.read_sql("""SELECT * FROM Salesman 
            WHERE city LIKE '%e' ;""", conn)
print(df1)
print(df1.dtypes)
print(df1.columns)

df2 = pd.read_sql("""SELECT SUM(Comission) as total_comission FROM Salesman
                  WHERE Comission > 0.12; """, conn)
print(df2)