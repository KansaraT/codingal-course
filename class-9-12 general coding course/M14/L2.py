import pandas as pd
import numpy as np

mydataset = {
    'cars': ['BMW', 'Mercedes', 'Tesla'],
    'passings': [3,7,4]
    }

df = pd.DataFrame(mydataset, index=np.arange(3)+1)
print(df)

#series
ser = pd.Series([1,2,3], index=['a','b','c'])
print(ser)

print(df.iloc[0,0])
print(df.loc[1,['cars']])