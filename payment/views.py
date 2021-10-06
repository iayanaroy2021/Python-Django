from django.shortcuts import render

# Create your views here.
import razorpay
from django.views.decorators.csrf import csrf_exempt

from django.test.client import Client

from adminapp.models import product, Category
from payment.models import payment
from userapp.models import register


def pay(request, id, regid,amt):
    if request.method == 'POST':

        amount =500
        amnt=product.objects.all().filter(id=id,pro_price=amt)
        print(amnt)
        order_currency = 'INR'
        print( amount )
        client = razorpay.Client(
            auth=('rzp_test_T0XcyerniuvbaY', 'yH3IrnrDjKvDHIGE50dbSBEf') )
        payment1 = client.order.create( {'amount': amount, 'currency': 'INR', 'payment_capture': 1} )
        coffee = payment()
        coffee.amount=amt
        coffee.userid=register.objects.get(id=regid)
        coffee.proid=product.objects.get(id=id)
        coffee.payment_id= payment1['id']
        coffee.paid=True
        coffee.save()

    pro = product.objects.get( id=id )
    regis = register.objects.get( id=regid )
    amnt=product.objects.filter(id=id,pro_price=amt)
    return render( request, 'Payment/index1.html', {'pro': pro, 'regis': regis,'amnt':amnt} )

    # return render( request, 'Payment/index1.html', {'pro': pro, 'regis': regis} )


@csrf_exempt
def success(request,id):
    regid=register.objects.get(id=id)
    return render( request, "Payment/success.html",{'regid':regid} )

#--------------------------------------------------Return Home------------------------------
def returnhome(request,id):
    regobj = register.objects.get( id=id )
    products = product.objects.all()
    cate = Category.objects.all().filter( cate_status=1 )
    return render( request, 'User/usr_homepage.html',{'regobj': regobj, 'products': products, 'cate': cate} )

