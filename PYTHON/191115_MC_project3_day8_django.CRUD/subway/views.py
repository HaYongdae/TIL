from django.shortcuts import render, redirect
from .models import Subway
import request

# Create your views here.

    
def index(request):

    subways = Subway.objects.all()[::-1]
    print(subways)

    context = {
        "subways":subways
    }

    return render(request,'subway/index.html', context)


def goOrderForm(request):

    return render(request,'subway/orderForm.html')

def order(request):

    name = request.POST.get("name")
    address= request.POST.get("address")
    phone= request.POST.get("phone")
    menu= request.POST.get("menu")
    bread= request.POST.get("bread")
    vegetable= request.POST.getlist("vegetable")
    sauce= request.POST.getlist("sauce")
    drink= request.POST.getlist("drink")

    subways = Subway()
    subways.name = name
    subways.address = address
    subways.phone = phone
    subways.menu = menu
    subways.bread = bread
    subways.vegetable = ",".join(vegetable)
    subways.sauce = ",".join(sauce)
    subways.drink = ",".join(drink)
    subways.save()

    return redirect(f'/subway/index/')

def goOrderDetail(request, id):

    subways = Subway.objects.get(id=id)
    print(f'{subways.id}')

    context = {
        "subways":subways
    }

    return render(request,'subway/orderCheck.html', context)


def update(request,id):
    subways = Subway.objects.get(id=id)

    context = { 
        "subways":subways
    }
    return redirect(request,'subway/updateOrder.html',context)
def update(request,id):
    subways = Subway.objects.get(id=id)
    name = request.POST.get('name')
    phone = request.POST.get('phone')
    address = request.POST.get('address')
    created_at = request.POST.get('created_at')

    subways.name = name

    subways.save()
    return redirect(f'/subway/index/')

def delete(request,id):
    subways = Subway.objects.get(id=id)
    subways.delete()
    return redirect(f'/subway/index/')