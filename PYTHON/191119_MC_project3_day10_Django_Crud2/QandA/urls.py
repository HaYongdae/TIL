from django.urls import path
from . import views

app_name = "QandA"
urlpatterns = [
    path('', views.index, name="index"),
    path('new/', views.new, name="new"),
    # path('create/', views.create, name="create"),
    path('<int:que_id>', views.detail, name="detail"),
    path('<int:que_id>/update/', views.update, name="update"),
    # path('<int:id>/save/', views.arti_save, name="save"),
    path('<int:id>/delete/', views.delete, name="delete"),
    path('<int:id>/ans/', views.ans, name="ans"),
    path('<int:que_id>/ans/<int:ans_id>/edit/', views.ans_edit, name="ans_edit"),
    path('<int:que_id>/ans/<int:ans_id>/del/', views.ans_del, name="ans_del")
]
