from django import forms
from .models import Book

# class BookForm(forms.ModelForm):
#     class Meta:
#         model = Book
#         fields = ['name', 'preface']


class BookForm(forms.Form):
    name = forms.CharField()
    preface = forms.CharField()
    
    def save(self,commit=True):
        self.instance = Book(**self.cleaned_data)
        if commit:
            self.instance.save()
        return self.instance