from django.urls import path
from . import views
urlpatterns = [
    path( 'pay/<id>/<regid>/<amt>', views.pay,name='pay'),
    path('success/<id>',views.success,name='success'),
    path( 'returnhome/<id>', views.returnhome, name='returnhome' )
]

