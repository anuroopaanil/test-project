from django.shortcuts import render
from joblib import load
model=load('./savedModels/model.joblib')

def predictor(request):
    if request.method == 'POST':
        try:
            sepal_length = float(request.POST['sepal_length'])
            sepal_width = float(request.POST['sepal_width'])
            petal_length = float(request.POST['petal_length'])
            petal_width = float(request.POST['petal_width'])

        
            y_pred = model.predict([[sepal_length, sepal_width, petal_length, petal_width]])
            if y_pred[0] == 0:
                y_pred = 'Setosa'
            elif y_pred[0] == 1:
                y_pred = 'Versicolor'
            else:
                y_pred = 'Virginica'
        except (ValueError, KeyError):
            y_pred = 'Invalid input'
        
        return render(request, 'prediction.html', {'result': y_pred})
    
    return render(request, 'prediction.html')