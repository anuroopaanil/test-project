from django.urls import path
from .views import predictor
urlpatterns=[
    
    path('', predictor, name='predictor'),
    ]

