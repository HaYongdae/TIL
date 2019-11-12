"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

# request가 처음 접하는 부분 - 어떤 앱과 연결시킬지 지정하는 부분

from django.contrib import admin
from django.urls import path
from pages import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index),
    path('job/<str:name>', views.job),
    path('plus/<int:num1>/<int:num2>/', views.plus),
    path('minus/<int:num1>/<int:num2>/', views.minus),
    path('profile/<str:name>/<int:age>/', views.profile),
    path('images/', views.images),
    path('dtl/', views.dtl),
    path('isYourDate/', views.isYourDate),
    path('isityourbirth/', views.isityourbirth),
    
]