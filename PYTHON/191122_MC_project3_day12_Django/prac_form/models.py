from django.db import models
from django.urls import reverse

# Create your models here.

class Book(models.Model):
    name = models.CharField(max_length=20)
    preface =models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.name}'

    # view 에서 redirect(모델명)을 통해 아래 메소드에서 지정된 action이 실행된다.
    def get_absolute_url(self):
        return reverse("prac:detail", args={self.id})
    