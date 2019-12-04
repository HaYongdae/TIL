from django.shortcuts import render, redirect, get_object_or_404
from .forms import SubwayForm
from .models import Subway
from IPython import embed

# Create your views here.

def index(request):
    return render(request, 'subway/index.html' )
def new(request):

    if request.method == "POST":
        form = SubwayForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('subway:index')
    else:
        form = SubwayForm()
        context = {
            'form':form
        }
        return render(request, 'subway/new.html', context )

def detail(request, s_id):
    subway = get_object_or_404(Subway, id=s_id)
    context = {
        "subway":subway
    }
    return render(request, 'subway/index.html', context)
    
def edit(request, s_id):
    subway = get_object_or_404(Subway, id=s_id)

    if request.method == "POST":
        # instance를 선언해주어야 기존의 값을 변경한다.
        form = SubwayForm(request.POST, instance=subway)
        if form.is_valid():
            subway = form.save()
            return redirect(subway)
    else:
        form = SubwayForm(initial=subway.__dict__)
        return render(request,'',{"form":form})

def delete(request, s_id):
    subway = get_object_or_404(Subway, id=s_id)

    if request.method == "POST":
        subway.delete()
    return redirect("subway:index ")


