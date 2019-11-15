from django.shortcuts import render
from .models import Subway

# Create your views here.
def index(request):
    return render(request, 'boards/index.html')

def subway_order(request):
    return render(request, 'boards/subway.html')

def subway_result(request):

    name = request.POST.get("name")
    date = request.POST.get("date")
    sandwich = request.POST.get("sandwich")
    size = request.POST.get("size")
    bread = request.POST.get("bread")
    # 여러 체크리스트를 받아올땐 getlist
    sauce = request.POST.getlist("sauce") 


    # DB 저장 부분
    subway = Subway()
    print(type(subway))
    subway.name = name
    subway.date = date
    subway.sandwich = sandwich
    subway.size = size
    subway.bread = bread
    subway.sauce = sauce
    subway.save()
    
    context = {
        'name': name,
        'date': date,
        'sandwich':sandwich,
        'size': size,
        'bread': bread,
        'sauce': ", ".join(sauce)
    }

    return render(request, 'boards/subway_result.html', context)


def subway_id(request, id):
    sub = Subway.objects.get(pk=id)
    context = {
        'id':sub
    }

    render (request, 'sub_id.html', context)