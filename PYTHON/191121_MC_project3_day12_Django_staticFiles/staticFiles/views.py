from django.shortcuts import render, redirect
from .models import StaticFiles

# Create your views here.

def index(request):

    images = StaticFiles.objects.all()

    context = {
        "images":StaticFiles
    }
    return render(request,'staticFiles/index.html', context)

def staticImages(request):
    return render(request,'staticFiles/staticImages.html')

def new(request):

    if request.method == "POST":

        title = request.POST.get('title')
        content = request.POST.get('content')
        image = request.FILES.get('image')

        images = StaticFiles(title = title, content = content , image = image)
        images.save()

        return redirect('staticFiles/staticFiles:index')

