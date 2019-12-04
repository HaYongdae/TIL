from django.shortcuts import render, redirect
from .models import Question, Answer

def index(request):
    ques = Question.objects.all()
    context = {
        'ques': ques
    }
    return render(request, 'QandA/index.html', context)

def new(request):
    # print(f'new : {request.method}')
    # return render(request, 'QandA/new.html') # 기존 new 함수
    # REST 하게 바꿨을때 폼이 새로 생성되는 부분.
    if request.method == "POST":
        que = Question(que=request.POST.get('que'))
        que.save()
        return redirect('QandA:index')
    else:
    # 폼 html 을 불러오는 부분.
        return render(request, 'QandA/new.html')

# RESTful 하게 수정 (POST /QandA/new)
# def create(request):
#     print(f'create : {request.method}')
#     que = que(title=request.POST.get('title'), content=request.POST.get('content'))
#     que.save()
#     return redirect('QandA:index')

def detail(request, que_id):
    print("ok")
    que = Question.objects.get(id=que_id)
    ans = que.answer_set.all()
    ans2 = que.answer_set.all().count
    context = {
            'que':que,
            'answers' :ans,
            'ans':ans2
            }
    print(context)
    return render(request, 'QandA/detail.html', context)

def update(request, que_id):
    que = Question.objects.get(id=que_id)
    # print(f'update : {request.method}') # request method 확인
    if request.method == "POST":
        que.title = request.POST.get('title')
        que.content = request.POST.get('content')
        que.save()
        return redirect('QandA:detail', que.id)
    else:
        return render(request, 'QandA/update.html', {'que':que})

# RESTful 하게 수정 (POST QandA/update/id)
# def quei_save(request, id):
#     que = que.objects.get(id=id)
#     print(f'save : {request.method}')

#     que.title = request.POST.get('title')
#     que.content = request.POST.get('content')

#     que.save()
#     return redirect('QandA:detail', que.id)

#---------------------------------------------
# delete 부분은 데이터를 삭제하는 동작이기에 GET으로 동작되어서는 안됨.
# GET으로 동작할 경우 브라우저 URL로도 데이터 삭제가 가능하게됨.
# DELETE method가 장고에서 지원이 안되기에 POST 방식으로 값을 넘겨 받음.
def delete(request, que_id):
    que = Question.objects.get(id=que_id)
    if request.method == "POST":
        que.delete()
        return redirect('QandA:index')
    else:
        # GET인경우 상세정보 페이지
        return redirect('QandA:detail', que.id)
def ans(request, que_id):
    que = Question.objects.get(id=que_id)

    if request.method == "POST":
        ansment = request.POST.get('ansment')
        ans = Answer()
        ans.ansment = ansment
        ans.que = que
        ans.save()
        return redirect('QandA:detail', que_id)

# return redirect('QandA.detail', ansment_id)
def ans_edit(request, que_id, ans_id):
    ans = Answer.objects.get(id=ans_id)
    if request.method == "POST":
        text = request.POST.get('ansment')
        ans.ansment = text
        ans.save()
        return redirect('QandA:detail', que_id)
    else :
        context = {
                'ansment':ans
                }
        return render(request, 'QandA/ansment_edit.html', context)

def ans_del(request, que_id, ans_id):
    ans = Answer.objects.get(id=ans_id)
    
    if request.method == "POST":
        ans.delete()
    return redirect('QandA:detail', que_id)