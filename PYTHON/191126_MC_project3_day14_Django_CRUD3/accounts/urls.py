from django.urls import path
from . import views

app_name="accounts"
urlpatterns = [
    path('signup/', views.signup, name="signup"),
    path('login/', views.login, name="login"),
    path('logout/', views.logout, name="logout"),
    path('edit/', views.edit, name="edit"),
    path('pwd/', views.chg_pwd, name="pwd"),
    path('delete/', views.delete, name="delete"),
    path('follow/', views.follow, name="follow")
]