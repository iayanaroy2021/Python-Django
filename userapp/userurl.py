from django.urls import path
from . import views

urlpatterns = [
    path('header',views.header),
    path( 'signup', views.signup, name='signup' ),
    path('login',views.usrlogin,name='login'),
    path('prodetails/<id>',views.prodetails,name='prodetails') ,

    path( 'details/<id>/<regid>', views.details, name='details' ),
    path('adtocart/<id>',views.addtocart),
    path('buy/<id>',views.buynow,name='buy'),
    path( 'account/<id>', views.account, name='account' ),
    path('address/<id>',views.address,name='address'),

    path('category/<id>/<regid>',views.category1,name='category'),
    path('buynow/<id>/<regid>',views.buynow,name='buynow'),

    path('vieworder/<id>',views.vieworder,name='vieworder')
    #path('editaddredd/<id>',views.editadd,name='editadd')








]

