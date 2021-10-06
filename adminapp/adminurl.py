from django.urls import path
from . import views

urlpatterns = [
    path( '', views.index, name='index' ),
    path( 'adminlogin', views.admin, name='adminlogin' ),
    # -------------------------------------------Manufacturer---------------------------------------
    path( 'manufacturer', views.manufacturer, name='manufacturer' ),
    path( 'editmanfct/<int:id>', views.editman, name='edit' ),
    path( 'dltmanfct/<id>', views.dltman, name='del' ),

    # ----------------------------------------------------Categoty------------------------------------
    path( 'category', views.category1, name='category' ),

    # -------------------------------------------------Type------------------------------------------
    path( 'producttype', views.productype, name='producttype' ),
    path( 'editproducttype/<int:id>', views.editprotype, name='protypedit' ),
    path( 'deleteproducttype/<id>', views.dltprotype, name='protypdel' ),

    # ------------------------------------------------Product-------------------------------------------
    path( 'product', views.productnew, name='product' ),
    path( 'productedit/<int:id>', views.prodctedit, name='prodctedit' ),
    path( 'prodctdelete/<int:id>', views.prodctdelete, name='prodctdelete' ),

    # ---------------------------------------------Orders------------------------------------------
    path( 'orders', views.orders, name='orders' ),
    #path('updateorder/<int:id>',views.updateorder,name='updateorder'),
    path('updateorderpay/<int:id>',views.updateorderpay,name='updateorderpay'),

    # ---------------------------------------------Logout-----------------------------------------------
    path( 'logout', views.logout, name='logout' )
]
