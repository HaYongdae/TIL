from django.db import models

# Create your models here.

class Subway(models.Model):
    name=models.CharField(max_length=10)
    created_at = models.DateTimeField(auto_now_add=True)
    address=models.CharField(max_length=30)
    phone=models.CharField(max_length=15)
    menu=models.CharField(max_length=10)
    bread=models.CharField(max_length=10)
    vegetable=models.CharField(max_length=10)
    sauce=models.CharField(max_length=10)
    drink=models.CharField(max_length=10)
    
    def __str__(self):
        return f'{self.name} {self.created_at}'