from django.db import models

# Create your models here.
class Board(models.Model):
    title = models.CharField(max_length=10)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.id} : {self.title}'

class Subway(models.Model):
    name = models.CharField(max_length=50)
    date = models.DateField(auto_now=False)
    sandwich = models.CharField(max_length=20)
    size = models.IntegerField()
    bread = models.CharField(max_length=20)
    sauce = models.CharField(max_length=20)

    def __str__(self):
        return f'{self.id} : {self.sandwich}'