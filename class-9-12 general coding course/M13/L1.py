import pandas as pd
import sqlite3

database= 'dataabase.db'

conn = sqlite3.connect(database)
print("Opened data successfully")


#read sql query for getting all the tables of database into a dataframe
tables = pd.read_sql("""SELECT * 
                    FROM sqlite_master
                    WHERE type='table';""", conn)

print(tables)

