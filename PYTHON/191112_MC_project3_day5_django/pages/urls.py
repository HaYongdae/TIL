from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('goOrderForm/', views.goOrderForm ),
    path('order_view/', views.order_view ),
]
