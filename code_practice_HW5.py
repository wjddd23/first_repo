# 5weeks HW _ deadline : 240410
# self study 10-2
from tkinter import *
import random

btnList=[None]*9
fnameList=["honeycomb.gif","icecream.gif","jellybean.gif","kitkat.gif","lollipop.gif","marshmallow.gif","nougat.gif","oreo.gif","pie.gif"]
random.shuffle(fnameList)
photoList=[None]*9
i,k=0,0
xPos,yPos=0,0
num=0

window=Tk()
window.geometry("210x210")

for i in range(0,9): 
    photoList[i]=PhotoImage(file=fnameList[i])
    btnList[i]=Button(window,image=photoList[i])
    
for i in range(0,3):
    for k in range(0,3):
        btnList[num].place(x=xPos,y=yPos)
        num+=1
        xPos+=70
    xPos=0
    yPos+=70
    
window.mainloop()



# self study 10-5
from tkinter import *
from tkinter.filedialog import *
from statistics import mean

def func_open():
    filename=askopenfilename(parent=window, filetypes=(("GIF file","*.gif"),("all files","*.*")))
    photo=PhotoImage(file=filename)
    x=photo.width()
    y=photo.height()
    for i in range(x):
        for j in range(y):
            grey=int(mean(photo.get(i,j)))
            photo.put("#%02x%02x%02x" % (grey,grey,grey),(i,j))
    pLabel.configure(image=photo)
    pLabel.image=photo
   
def func_exit():
    window.quit()   
    window.destroy()
    
window=Tk()
window.geometry("400x400")
window.title("명화 감상하기")

photo=PhotoImage()
pLabel=Label(window,image=photo)
pLabel.pack(expand=1,anchor=CENTER)

mainMenu=Menu(window)
window.config(menu=mainMenu)
fileMenu=Menu(mainMenu)
mainMenu.add_cascade(label="파일",menu=fileMenu)
fileMenu.add_command(label="파일 열기",command=func_open)
fileMenu.add_separator()
fileMenu.add_command(label="프로그램 종료",command=func_exit)

window.mainloop()



# assignment-3
from tkinter import *
window=Tk()

def rdo_change(): 
    if var.get()==1:
        label1.configure(text="벤츠")
    else:
        label1.configure(text="포르쉐")
        
var=IntVar()
rdo1=Radiobutton(window,text="벤츠",variable=var,value=1,command=rdo_change)
rdo2=Radiobutton(window,text="포르쉐",variable=var,value=2,command=rdo_change)
label1=Label(window,text="선택한 차량",fg="red")

rdo1.pack()
rdo2.pack()
label1.pack()

window.mainloop()
# 따라서 정답은 1:var.get(), 2:IntVar(), 3:var 이다.



# assignment-4
from tkinter import *
window=Tk()

button1=Button(window,text="버튼1")
button2=Button(window,text="버튼2")
button3=Button(window,text="버튼3")

button1.pack(side=TOP)
button2.pack(side=TOP)
button3.pack(side=TOP)

window.mainloop()
# 정답은 (1): LEFT, (2): RIGHT, (3): TOP, (4): BOTTOM 이다.



# assignment-5
from tkinter import *
from time import *

fnameList=["jeju1.gif","jeju2.gif","jeju3.gif","jeju4.gif","jeju5.gif","jeju6.gif","jeju7.gif","jeju8.gif","jeju9.gif"]
num=0

def clickNext():
    global num
    num+=1
    if num>8:
        num=0
    pLabel.configure(text=fnameList[num])

def clickPrev():
    global num
    num-=1
    if num<0:
        num=8
    pLabel.configure(text=fnameList[num])

window=Tk()
window.geometry("600x100")

btnNext=Button(window,text="다음 >>",command=clickNext)
btnPrev=Button(window,text="<< 이전",command=clickPrev)

f=fnameList[0]
pLabel=Label(window,text=f, font=("Arial",20),fg="blue")

btnNext.place(x=450,y=20)
btnPrev.place(x=150,y=20)
pLabel.place(x=300,y=20)

window.mainloop()
