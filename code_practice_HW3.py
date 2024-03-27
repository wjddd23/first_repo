# 2weeks HW
# 4
score=int(input("점수를 입력하세요 : "))
if score >= 90:
    print("장학생",end='')
elif score >= 60:
    print("합격",end='')
else:
    print("불합격",end='')
print("입니다. ^^")


# 5-1
# 정답 3번
num=5
if num%2==0:
    res='짝수'
else:
    res='홀수'
print(res)

res='짝수' if num%2==0 else '홀수'


# 5-2
nn=[100,200,300,400,500]
print(nn[4]) # 500
print(nn[-1]) # 500
print(nn[-2]) # 400
print(nn[1:4]) # 200,300,400
print(nn[0:1]) # 100
print(nn[2:-1]) # 300,400 # 중요! 매트랩과 인덱싱이 달라서 헷갈림
print(nn[0::2]) # 100,300,500
print(nn[::-1]) # 500,400,300,200,100
print(nn[::-2]) # 500,300,100


# 6
nn=[100,200,300,400,500]
nn[1]=777
nn[1]=[444,555]
nn[1:4]=[444,555]
nn[2:]=[]
print(nn) #nn=[100 444]


# 8 
hap=0
n=1234
while n<=4567:
    if n%444==0:
      hap+=n
    n+=1
print(hap) # 정답은 23088
          

# 9
happ=0
for n in range(3333,9999):
    if n%1234==0: continue
    if happ+n>=100000:break
    happ+=n
print(happ) # 정답은 97063


# 14
myData=[[n*m for n in range(1,3)] for m in range(2,4)]
print(myData) # n은 1부터 2, m은 2부터 3의 범위에 있으므로 myData=[[2,4],[3,6]]이다.
