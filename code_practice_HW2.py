# practice 01

print("100") # 100
print(100) # 100
print(50+50) # 100
print("50+50") # 50+50

# practice 02

print('%d / %d = %d' % (5,10,5/10)) # 5/10=0 

# practice 03

print("%04d" % 876) # 0876
print("%5s" % "CookBook") # CookBook
print("%1.1f" % 123.45) # 123.5

# practice 04

print("{2:d}{0:d}{1:d}".format(111,222,333)) # 333111222

# practice 11

print(int('1011',2)) # 11
print(int('1A',16)) # 26

# practice 13

a=int('1002',2) # Error. There is no 2.
b=int('1008',8) # Error. There is no 8.
c=int('AAFG',16) # Error. There is no G.

# practice 15

num=12345678
hex_num=hex(num)[2:]
oct_num=oct(num)[2:]
bin_num=bin(num)[2:]
print("10진수 ==>", num)
print("16진수 ==>", hex_num)
print("8진수 ==>", oct_num)
print("2진수 ==>", bin_num)

