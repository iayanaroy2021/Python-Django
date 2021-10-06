from django.contrib import messages
from django.shortcuts import render

from adminapp.models import product, manufctr, Category, producttype, country
from payment.models import payment, order
from userapp.models import login, register, adreess


# ----------------------------------------------User Header--------------------------------------------


def header(request):
    cate = Category.objects.all().filter( cate_status=1 )
    return render( request, 'User/header.html', {'cate': cate} )


# registration----------------------------------------------------------------------------------

def signup(request):
    if request.method == 'POST':

        name = request.POST.get( "name" )
        gender = request.POST.get( "user_gender" )
        # phone = request.POST.get( "phone" )
        email = request.POST.get( "email" )
        pwd = request.POST.get( "password" )

        if login.objects.filter( usr_email=email ).exists():
            # messages.error(  "Mail Id Already exists" )
            return render( request, "common/signup.html", context={'error': 'Email Id already exists'} )
        else:
            log = login()
            log.usr_email = email
            log.usr_passw = pwd
            log.save()

            userobj = register()
            userobj.usr_loginid = log
            userobj.usr_name = name
            userobj.usr_gender = gender
            userobj.email = email
            userobj.save()
            return render( request, "common/indexed.html" )
    return render( request, "common/signup.html" )


# login------------------------------------------------------------------------------
def usrlogin(request):
    if request.method == 'POST':
        uemail = request.POST.get( "login_email" )
        passwrd = request.POST.get( "login_password" )
        if login.objects.filter( usr_email=uemail, usr_passw=passwrd, usr_role=1 ).exists():
            loginobj = login.objects.get( usr_email=uemail, usr_passw=passwrd )
            request.session['userid'] = loginobj.id
            regobj = register.objects.get( usr_loginid_id=loginobj.id )
            products = product.objects.all()
            cate = Category.objects.all().filter( cate_status=1 )
            return render( request, 'User/usr_homepage.html',
                           {'regobj': regobj, 'products': products, 'cate': cate} )

        else:
            return render( request, 'common/login.html', context={'error': "email or password not exists"} )

    return render( request, 'common/login.html' )


# Product Details-----------------------------------------------------------------
def prodetails(request, id):
    proid = product.objects.get( id=id )
    manufct = manufctr.objects.all().filter( manu_status=1 )
    cate = Category.objects.all().filter( cate_status=1 )
    protype = producttype.objects.all().filter( protype_status=1 )
    return render( request, "User/user_viewdtls.html",
                   {'proid': proid, 'manufct': manufct, 'cate': cate, 'protype': protype} )


def details(request, id, regid):
    if adreess.objects.filter( ad_userid_id=regid ).exists():
        proid = product.objects.get( id=id )
        reg = register.objects.get( id=regid )
        manufct = manufctr.objects.all().filter( manu_status=1 )
        cate = Category.objects.all().filter( cate_status=1 )
        protype = producttype.objects.all().filter( protype_status=1 )
        return render( request, "User/user_viewdtls.html",
                       {'proid': proid, 'manufct': manufct, 'cate': cate, 'protype': protype, 'reg': reg} )
    else:
        cout = country.objects.all()
        usrid = register.objects.get( id=regid )
        return render( request, 'User/user_adress.html', {'usrid': usrid, 'cout': cout} )


def addtocart(request, id):
    proid = product.objects.get( id=id )
    manufct = manufctr.objects.all().filter( manu_status=1 )
    cate = Category.objects.all().filter( cate_status=1 )
    protype = producttype.objects.all().filter( protype_status=1 )
    return render( request, "User/user_viewdtls.html",
                   {'proid': proid, 'manufct': manufct, 'cate': cate, 'protype': protype} )


# ------------------------------------------------Buy--------------------------------------
def buynow(request, id, regid):
    if request.method == 'POST':
        proid = product.objects.get( id=id )
        regid = register.objects.get( id=regid )

        return render( request, "Payment/payment.html", {'proid': proid, 'regid': regid} )

    proid = product.objects.get( id=id )
    regid = register.objects.get( id=regid )
    adresid = adreess.objects.get( ad_userid=regid )
    return render( request, 'User/user_buynow.html', {'proid': proid, 'regid': regid, 'adresid': adresid} )

#------------------------------------------------View Order-------------------------
def vieworder(request,id):
    pay=payment.objects.all().filter( userid_id = id )
    products=product.objects.all()
    reg=register.objects.get(id=id)
    adre=adreess.objects.get( ad_userid=id )
    order1=order.objects.all()
    return render(request,'User/user_vieworder.html',{'pay':pay,'products':products,'reg':reg,'adre':adre,'order1':order1})


# -----------------------------------------------Account-----------------------------------------
def account(request, id):
    if adreess.objects.filter( ad_userid=id ).exists():
        addrsdtls = adreess.objects.get( ad_userid=id )
        usrid = register.objects.get( id=id )
        cout = country.objects.all()
        return render( request, 'User/user_profile.html', {'usrid': usrid, 'cout': cout, 'addrsdtls': addrsdtls} )
    else:
        # addrsdtls = adreess.objects.get( ad_userid=id )
        cout = country.objects.all()
        usrid = register.objects.get( id=id )
        return render( request, 'User/user_adress.html', {'usrid': usrid, 'cout': cout} )


# ------------------------------------------------User Address---------------------------------
def address(request, id):
    if request.method == 'POST':
        usrid = register.objects.get( id=id )
        adres = adreess()
        adres.ad_state = request.POST.get( 'state' )
        adres.ad_adres1 = request.POST.get( 'ad1' )
        adres.ad_adres2 = request.POST.get( 'ad2' )
        adres.ad_town = request.POST.get( 'town' )
        adres.ad_pin = request.POST.get( 'pin' )
        adres.ad_phone = request.POST.get( 'phone' )
        adres.ad_countryid = country.objects.get( id=request.POST.get( 'country' ) )
        adres.ad_userid = register.objects.get( id=id )
        adres.save()
        regobj = register.objects.get( id=id )
        products = product.objects.all()
        cate = Category.objects.all().filter( cate_status=1 )
        return render( request, 'User/usr_homepage.html', {'regobj': regobj, 'products': products, 'cate': cate} )


# --------------------------------------Filter----------------------------------------------
def category1(request, id, regid):
    pros = producttype.objects.all().filter( cat_id=id )
    products = product.objects.all().filter( protype_id=pros.id )
    regobj = register.objects.get( id=regid )
    cate = Category.objects.all()
    return render( request, "User/usr_computer.html", {'products': products, 'regobj': regobj, 'cate': cate} )

