from django.shortcuts import render, redirect, get_object_or_404
from .forms import BookForm
from .models import Book
from IPython import embed

# Create your views here.

def index(request):
    return render(request, 'prac_form/index.html' )
def new(request):

    if request.method == "POST":
        form = BookForm(request.POST)
        if form.is_valid():
            
            # model form 을 사용한 경우
            # form.save()

            # model 만 사용한 경우
            book = Book()
            book.name = form.cleaned_data['name'] 
            book.preface = form.cleaned_data.get('preface')
            book.save()
            
            return redirect('prac:index')
    else:
        form = BookForm()

        context = {

            'form':form
        }

        return render(request, 'prac_form/new.html', context )

def detail(request, b_id):
    book = Book.objects.get(id=b_id)
    book = get_object_or_404

    context = {
        "book":book
    }

    return render(request, 'prac_form/index.html', context)
    
def edit(request, b_id):
    book = Book.objects.get(id=b_id)

    if request.method == "POST":
        form = BookForm(request.POST)
        if form.is_valid():
            book = form.save()
            return redirect(book)
    else:
        form = BookForm(initial=book.__dict__)

    return render(request,'',{"form":form})

def delete(request, b_id):
    book = Book.objects.get(id=b_id)

    if request.method == "POST":
        book.delete()
    return redirect("prac:index ")


