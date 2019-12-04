from django.db import models
from django.urls import reverse

class Subway(models.Model):
    name = models.CharField(max_length=20)
    address = models.CharField(max_length=50)
    phone = models.CharField(max_length=13)
    menu = models.CharField(max_length=20)
    bread = models.CharField(max_length=30)
    vegetable = models.CharField(max_length=50)
    sauce = models.CharField(max_length=50)
    drink = models.CharField(max_length=10)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f'{self.id}. {self.name} : {self.menu}'
    def get_absolute_url(self):
        return reverse("model_detail", kwargs={self.id})
    
