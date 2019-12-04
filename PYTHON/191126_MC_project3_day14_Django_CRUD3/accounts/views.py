from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, UserChangeForm, PasswordChangeForm
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as auth_logout
from IPython import embed
from .forms import UserCustomChangeForm, UserCustomCreationForm
from django.contrib.auth import update_session_auth_hash as update_session
from django.contrib.auth import get_user_model, get_user

# Create your views here.
def signup(request):
    
    if request.method == "POST":
        # form = UserCreationForm(request.POST)
        form = UserCustomCreationForm(request.POST)
        #embed()
        if form.is_valid():
            user = form.save()
            auth_login(request, user)
            #user = form.save()
            return redirect('boards:index')
    else:
        # form = UserCreationForm()
        form = UserCustomCreationForm()
        #embed()

    
    context = { 'form':form,
                "label":"회원가입"}
    return render(request, 'accounts/auth_form.html', context)

def login(request):
    if request.method == "POST":
        form = AuthenticationForm(request, request.POST)
        if form.is_valid():
            auth_login(request, form.get_user())
            return redirect('boards:index')
    else:        
        form = AuthenticationForm()

    context = { 
        'form':form,
        "label":"로그인"
         }
    return render(request, 'accounts/auth_form.html', context)

def logout(request):
    if request.method == "POST":
        auth_logout(request)
    return redirect('boards:index')

def edit(request):
    if request.method =="POST":
        # PasswordChangeForm 은 (POST에 담긴 변수, instance = request.user 형태 기억하기)
        form = UserCustomChangeForm(request.POST, instance = request.user)
        if form.is_valid():
            form.save()
            return redirect('boards:index')
    else:
        form = UserCustomChangeForm()

    context = { 
        "form":form,
        "label":"수정"
        }
    return render(request,'accounts/auth_form.html',context)


def chg_pwd(request):

    if request.method =="POST":
        # PasswordChangeForm 은 (user정보, POST값 순으로 받아온다)
        form = PasswordChangeForm(request.user,request.POST)
        if form.is_valid:
            user = form.save()
            # request를 첫 인자로 받아 현재 저장된 session값을 받고, 어떤 값을 저장할 것인지 지정한다.)
            update_session(request, user)
            return redirect('accounts:edit')
    else:
        form = PasswordChangeForm(request.user)

    context = { "form":form,
            "label":"비밀번호변경"}
    return render(request,'accounts/auth_form.html',context)


def delete(request):
    if request.method == "POST":
        request.user.delete()

    return redirect('boards:index')


# Follow 로직
def follow(request, u_id):
    person = get_object_or_404(get_user_model(), id=u_id)

    # person의 follower에 request.user가 있는지 확인하여 제거/추가
    if person.followers.filter(id=request.user.id).exists():
        # remove
        person.followers.remove(request.user)
    else:
        # add
        person.followers.add(request.user)

    return redirect('boards:index')