

# Create your models here.
# MVT- model,view,template:-model:database,view: buisiness logic,template:the html and front end page
#MVC(java)- model,view,controller:-,model: database,view:template

from django.http import HttpResponse

def welcome(request):
    return  HttpResponse ('hello world')