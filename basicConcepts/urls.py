from django.urls import path
from basicConcepts import views
from . import views
urlpatterns =[
    path('',views.welcome,name='welcome'),
    path('user',views.user,name='user')]
    