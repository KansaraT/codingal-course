import pandas as pd
import sqlite3

database = 'dataabase.db'
conn = sqlite3.connect(database)

tables = pd.read_sql("""SELECT * FROM sqlite_master
                     WHERE type = 'table';""", conn)
print(tables)

