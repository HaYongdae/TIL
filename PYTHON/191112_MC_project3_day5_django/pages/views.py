from django.shortcuts import render
import requests
import random

# Create your views here.

def drawAascii(request):

    # requests 를 이용하여 폰트 리스트를 스트링으로 받아온 후, 
    fontStr = requests.get('http://artii.herokuapp.com/fonts_list').text
    # split()을 통해 리스트로 받는다
    fontList = fontStr.split()
    # 그리고 랜덤.초이스(리스트명)을 통해 하나를 선택한다.
    font = random.choice(fontList)
    
    # 폼 태그로부터 전해진 name = "text" 부분과 위의 font 부분을 url 에 합쳐 requests한다.
    text = request.GET.get('text')
    url = f'http://artii.herokuapp.com/make?text={text}&font={font}'
    # requests 의 응답 값을 text로 변환한 후,
    responseFromAscii = requests.get(url).text
    #  html 에 뿌려준다.
    context = {
        "res": responseFromAscii
    }
    # 받는 html에서 <pre> 태그로 받으면 줄바꿈이 자동으로 이뤄진다.
    return render(request,'pages/AsciiView.html',context)

# form 태그를 받기 위한 함수
def goForm(request):
    return render(request,'pages/formForAscii.html')


def user_create(request):
    username = request.POST.get('name')
    pw = request.POST.get('pw')
    context = {
        'username':username,
        'pw':pw
    }
    return render(request, 'pages/user.html', context)

def goUserForm(request):
    return render(request,'pages/user_new.html')



def order_view(request):
    name = request.POST.get('name')
    date = request.POST.get('date')
    menu = request.POST.get('menu')
    size = request.POST.get('size')
    bread = request.POST.get('bread')
    source = request.POST.get('source')

    context = {
        'name':name,
        'date':date,
        'menu':menu,
        'bread':bread,
        'size':size,
        'source': ",".join(source)
    }
    return render(request, 'pages/orderCheck.html', context)

def goOrderForm(request):
    return render(request,'pages/orderForm.html')

# Static 
def static_example(request):
    return render(request, 'pages/static.html')

def index(request):
    return render(request,'pages/index.html')
