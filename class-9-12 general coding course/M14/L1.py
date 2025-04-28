
import numpy as np
from numpy import random

arr1 = np.array([1,2,3,4,5])
print(arr1)
print(type(arr1))
print(arr1.dtype)

arr2 = np.array([[1,2,3,5],[3,4,5,6]])
print(arr2.shape)
print(arr2.reshape(8,1))

arr3 = np.array([1,2,3,4,4])

arr = np.concatenate((arr1, arr3))
print(arr)

x = np.where(arr==4)
print(x)
print(np.sort(arr))

print(random.randint(100))

print(np.arange(3)+1)
