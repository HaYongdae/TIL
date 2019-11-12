from django.shortcuts import render
from faker import Faker
from django.http import HttpResponse
import random
from datetime import datetime

# Create your views here.
def index(request):
    #return HttpResponse("Hello Django")
    return render(request, 'index.html')

    
def age(request, age):
    context = {
        'age' : age
        } #dictionary format
    return render(request, 'age.html', context)     

    
def square(request, age1):
    #age1 = age1**age1
    context = {
        'age1' : age1**2
        } #dictionary format
    return render(request, 'age1.html', context)   


def plus(request, num1, num2):
    #num1 = num1 - num2
    context = {
        'num1' : num1,
        'num2' : num2,
        'res' : num1-num2
        } #dictionary format
    return render(request, 'num1.html', context)   
def minus(request, num1, num2):
    #num1 = num1 - num2
    context = {
        'num1' : num1,
        'num2' : num2,
        'res' : num1-num2
        } #dictionary format
    return render(request, 'num1.html', context)   

def profile(request, name, age):
    context = {
        'name' : name,
        'age' : age
        } #dictionary format
    return render(request, 'nameage.html', context)     




def indian(request, name1):
    
    menu1 = ["시끄러운", "푸른", "적색", "푸른", "조용한", "웅크린", "백색", "지혜로운", "용감한", "날카로운"]
    menu2 = ["늑대", "태양", "양", "매", "황소", "불꽃", "나무", "달빛", "말", "돼지", "하늘", "바람"]
    menu3 = ["함께 춤을", "의 기상", "그림자 속에", "", "", "", "의 환생", "의 죽음", "아래에서", "보라"]
    l1 = random.choice(menu1)
    l2 = random.choice(menu2)
    l3 = random.choice(menu3)
    context = {
        'name1' : name1,
        'l1' : l1,
        'l2' : l2,
        'l3' : l3
    }
    return render(request, 'indian.html', context)




def lotto(request):
    num = range(1,47)
    lotto = random.sample(num, 6)
    context = {
        'lotto' : lotto
    }
    return render(request, 'lotto.html', context)

def job(request, name):
    fake=Faker('ko_KR')
    job=fake.job()

    context = {
        'name' : name,
        'job' : job
    }

    return render(request,'job.html',context)

def images(request):
    num = random.choice(range(1,1000))
    url = f"https://picsum.photos/id/{num}/200/300"

    context = {
        "url":url,
    }
    return render(request,'image.html',context)

def dtl(request):
    food = ["짜장면", "짬뽕", "탕수육","양장피","군만두","고추잡채","볶음밥"]
    my_sentence = 'Life is short, you need python'
    message = ['apple','banana','cucumber','mango']
    datetimenow = datetime.now
    empty_list = []

    context = {
        "foods":food,
        "my_sentence":my_sentence,
        "message": message,
        "timenow": datetimenow,
        "empty_list":empty_list,
    }

    return render(request, 'dtl.html',context)

def isYourDate(request):
    date = "10월 06일"

    context = {
        "date": date
    }
    return render(request,'isYourDate.html', context)

def isityourbirth(request):
    date = datetime.now()
    mybirthday = datetime(1992, 10, 6)
    Dday = (date - mybirthday).days
    if date.month == 10 and date.date == 6:
        res = True
    else:
        res = False

    context = {
        "res":res
        "Dday":Dday
    }
    return render(request,'isYourDate.html',context)