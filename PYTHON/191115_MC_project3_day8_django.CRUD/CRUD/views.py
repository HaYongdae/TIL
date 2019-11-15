from django.shortcuts import render, redirect
from .models import Article
import request

# Create your views here.

def index(request):
    # 파이썬 문법으로 list 뒤집는 방법
    articles = Article.objects.all()[::-1]
    # articles = reversed(Article.objects.all())

    # sql 구문을 빌려 역순으로 뒤집는 방법
    articles = Article.objects.order_by('-id')

    context = {
        "articles":articles
    }
    return render(request, 'CRUD/index.html', context)

def takeOneArticle(request, pk):
    article = Article.objects.get(pk=pk)

    context = {
        "article":article
    }

    return render(request, 'CRUD/detail.html', context)

def takeOneUpdate(request, pk):
    article = Article.objects.get(pk=pk)
    context = {
        "article":article
    }

    return render(request, 'CRUD/updateArticle.html', context)

def new(request):
    return render(request, 'CRUD/new.html')

def create(request):

    # 변수 받아오기 (form ->)
    title = request.POST.get('title')
    content = request.POST.get('content')

    # DB에 저장하는 부분 (model 을 생성하고 save)
    article = Article()
    article.title = title
    article.content = content
    article.save()

    context = {
        "title":title
    }

    return render(request, 'CRUD/created.html', context)


def update(request,pk):
    article = Article.objects.get(pk=pk)
    title = request.POST.get('title')
    content = request.POST.get('content')

    article.title = title
    article.content = content

    article.save()
    return redirect(f'/CRUD/index/')

def delete(request,pk):
    article = Article.objects.get(pk=pk)

    article.delete()

    return redirect(f'/CRUD/index/')

