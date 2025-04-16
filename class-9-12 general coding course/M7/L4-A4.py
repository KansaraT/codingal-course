import math 

def prime(n):
  if n<=0:
    return("Invalid Entry")
  
  elif n==1:
    return("Not a prime no")

  for i in range(2, int(math.sqrt(n))+1):
    if n%i == 0:
      return("Not a prime no")
  return("Prime no")

n = int(input("Enter the number: "))
prime(n)