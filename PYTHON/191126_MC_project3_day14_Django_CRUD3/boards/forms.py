from django import forms
from .models import Board, Comment

class BoardForm(forms.ModelForm):
    class Meta:
        model = Board 
        fields = ['title', 'content']

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['comment'] # 튜플로 사용할 때에는 1개이면 뒤에 ,를 꼭 찍어줘야함!