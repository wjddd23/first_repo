# 4Weeks HW
# assignment1
# 5
ss='Python'

for i in range(0,len(ss)):
    print(ss[i]+'$',end='')
    
    

# 11     
str='파이썬###CookBook$$$@@@열공중1234'    

def onlystr(x):
    output=''    
    for c in x:
        if (c.isalpha()):
            output+=c
    return output
print(onlystr(str))


# 9
inStr, outStr="Python",""
strLen=len(inStr)

for i in range(0,strLen):
    outStr+=inStr[strLen-(i+1)]
print("내용을 거꾸로 출력 --> %s"%outStr)



# 13
import turtle
import math

str="나 보기가 역겨워 가실 대에는 말없이 고이 보내드리오리다 영변에 약산 진달래꽃 아름따다 가실 길에 뿌리오리다"
count=len(str)

screen=turtle.Screen()
screen.setup(500,500)

pen=turtle.Turtle()
pen.speed(0)
pen.penup()

radius=200
font_size=20
angle=360*2/count

for i in range(count):
   cur_angle=i*angle
   radian=3.14*cur_angle/180
   x=radius*math.cos(radian)
   y=radius*math.sin(radian)
   pen.goto(x,y)
   pen.write(str[i],align="center",font=("Arial",font_size,"normal"))



# assignment2
# 3
def plus(v1,v2,v3):
    result=0
    result=v1+v2+v3
    return result
    
hap=plus(100,200,300)
print(hap) 



# 4 
def f1():
    print(var)
def f2():
    var=10
    print(var)

var=100
f1() # is 100 (global variable)
f2() # is 10 (local variable)



# 11
def addNumber(num):
    if num==1:
        return 1
    else:
        return num+addNumber(num-1)
print(addNumber(100))



# 8 
def myFunc(p1=1,p2=2,p3=3):
    ret=p1+p2+p3
    return ret

print("매개변수 없이 호출 ==>",myFunc())    # 출력: 6
print("매개변수가 1개로 호출 ==>".myFunc(1))   # 출력: 6
print("매개변수가 2개로 호출 ==>",myFunc(1, 2))  # 출력: 6
print("매개변수가 3개로 호출 ==>",myFunc(1, 2, 3))  # 출력: 6
    


