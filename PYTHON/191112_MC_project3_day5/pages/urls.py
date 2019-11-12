from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('drawAascii/', views.drawAascii ),
    path('goForm/', views.goForm ),
    path('index/', views.index ),
    path('goUserForm/', views.goUserForm ),
    path('user_create/', views.user_create ),
    path('goOrderForm/', views.goOrderForm ),
    path('order_view/', views.order_view ),
    path('static_example/', views.static_example),
]
