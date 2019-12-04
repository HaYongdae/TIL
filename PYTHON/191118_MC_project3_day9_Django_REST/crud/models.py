from django.db import models

# Create your models here.

class Article(models.Model):
    title = models.CharField(max_length=50)
    content = models.TextField()
    # 필드가 추가될 때 시간 자동 저장
    created_at = models.DateTimeField(auto_now_add=True)
    # auto_now는 add가 아닌 수정 시 시간 자동 저장
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.id} {self.title}'

class Comment(models.Model):
    comment = models.CharField(max_length=200)
    art = models.ForeignKey