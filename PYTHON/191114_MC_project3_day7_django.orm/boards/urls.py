
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('subway/', views.subway_order),
    path('subway_result/', views.subway_result),
    path('subway_id/', views.subway_id),

]
