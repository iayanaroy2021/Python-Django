from django.shortcuts import render

# Create your views here.
from payment.models import payment, order
from userapp.models import register, login, adreess
from adminapp.models import manufctr, producttype, product, Category


def index(request):
    products = product.objects.all()
    return render( request, 'common/indexed.html', {'products': products} )


def admin(request):
    if request.method == 'POST':
        usr = request.POST.get( 'admin_user' )
        paswrd = request.POST.get( 'admin_pass' )
        if login.objects.filter( usr_email=usr, usr_passw=paswrd ).exists():
            loginobj = login.objects.get( usr_email=usr, usr_passw=paswrd )
            request.session['userid'] = loginobj.id
            role = loginobj.usr_role
            if role == 0:
                log = login.objects.all()
                reg = register.objects.all()
                adres = adreess.objects.all()
                products = product.objects.all()

                # --------------------------------------Count--------------------------------------
                usercount = register.objects.all().count()
                revenuecount = payment.objects.all()
                sum = 0
                for rev in revenuecount:
                    sum = sum + rev.amount
                print( sum )
                ordercount = payment.objects.all().count()
                productcount = product.objects.all().count()
                return render( request, "admin/admin_home.html",
                               {'reg': reg, 'adres': adres, 'products': products, 'log': log, 'usercount': usercount,
                                'ordercount': ordercount, 'productcount': productcount, 'sum': sum} )
            else:
                error = "Invalid"
                return render( request, 'admin/admin_login.html', {'error': error} )
    return render( request, 'admin/admin_login.html' )


# ----------------------------------------------------manufacturer----------------------------------------
def manufacturer(request):
    if request.method == 'POST':
        manf_name = request.POST.get( 'manu_name' )
        manf_loc = request.POST.get( 'manu_loc' )
        manu = manufctr()
        manu.manu_name = manf_name
        manu.manu_location = manf_loc
        manu.save()
    man = manufctr.objects.all()
    return render( request, 'admin/admin_manuf.html', {'man': man} )


def editman(request, id):
    if request.method == 'POST':
        manf_name = request.POST.get( 'manu_name' )
        manf_loc = request.POST.get( 'manu_loc' )
        manu = manufctr.objects.get( id=id )
        manu.manu_name = manf_name
        manu.manu_location = manf_loc
        manu.save()
        man = manufctr.objects.all()
        return render( request, 'admin/admin_manuf.html', {'man': man} )

    edit = manufctr.objects.get( id=id )
    return render( request, 'admin/admin_manufedit.html', {'edit': edit} )


def dltman(request, id):
    man = manufctr.objects.get( id=id )
    man.delete()
    return render( request, 'admin/admin_manuf.html' )


# --------------------------------------------------Category---------------------------------------
def category1(request):
    if request.method == 'POST':
        cate_name = request.POST.get( 'category' )
        cat = Category()
        cat.cate_name = cate_name
        cat.save()
    cat = Category.objects.all().filter( cate_status=1 )
    return render( request, "admin/admin-category.html", {'cat': cat} )


# -----------------------------------------ProductType---------------------------------------------
def productype(request):
    if request.method == 'POST':
        ptype_name = request.POST.get( 'pro_type' )
        ptype_short = request.POST.get( 'pro_short' )
        pro = producttype()
        pro.protype_name = ptype_name
        pro.protype_short = ptype_short
        pro.cat = Category.objects.get( id=request.POST.get( 'category' ) )
        pro.save()
        # return render(request,"admin/admin_protype.html")

    prodct = producttype.objects.all()
    cat = Category.objects.all()
    return render( request, "admin/admin_protype.html", {'prodct': prodct, 'cat': cat} )


def dltprotype(request, id):
    protyp1 = producttype.objects.get( id=id )
    protyp1.delete()
    prodct = producttype.objects.all()
    cat = Category.objects.all()
    return render( request, 'admin/admin_protype.html', {'prodct': prodct, 'cat': cat} )


def editprotype(request, id):
    if request.method == 'POST':
        ptype_name = request.POST.get( 'pro_type' )
        ptype_short = request.POST.get( 'pro_short1' )
        pro = producttype.objects.get( id=id )
        pro.protype_name = ptype_name
        pro.protype_short = ptype_short
        pro.save()
        prodct = producttype.objects.all()
        cat = Category.objects.all()
        return render( request, 'admin/admin_protype.html', {'prodct': prodct, 'cat': cat} )

    editpro = producttype.objects.get( id=id )
    cat1 = Category.objects.all()
    return render( request, 'admin/admin-editprotype.html', {'editpro': editpro, 'cat1': cat1} )


# -------------------------------------------product------------------------------------------------
def productnew(request):
    if request.method == 'POST':
        Product = product()
        Product.pro_name = request.POST.get( 'pro_name' )
        Product.protype = producttype.objects.get( id=request.POST.get( 'pro_type' ) )
        Product.manuf = manufctr.objects.get( id=request.POST.get( 'pro_man' ) )
        Product.pro_spec = request.POST.get( 'pro_spec' )
        Product.pro_color = request.POST.get( 'pro_color' )
        Product.pro_price = request.POST.get( 'pro_price' )
        Product.pro_stock = request.POST.get( 'pro_stock' )
        if len( request.FILES ) != 0:
            Product.pro_image = request.FILES['pro_pp']
        Product.save()

    protype = producttype.objects.all().filter( protype_status=1 )
    manufct = manufctr.objects.all().filter( manu_status=1 )
    pros = product.objects.all().filter( pro_status=1 )
    cate = Category.objects.all().filter( cate_status=1 )

    return render( request, 'admin/admin_product.html',
                   {'protype': protype, 'manufct': manufct, 'pros': pros, 'cate': cate} )


def prodctedit(request, id):
    if request.method == 'POST':
        pros1 = product.objects.get( id=id )
        pros1.pro_name = request.POST.get( 'product' )
        pros1.pro_spec = request.POST.get( 'pro_spec' )
        pros1.pro_color = request.POST.get( 'color' )
        pros1.pro_stock = request.POST.get( 'price' )
        pros1.pro_price = request.POST.get( 'stock' )
        if len( request.FILES ) != 0:
            pros1.pro_image = request.FILES['image']
        pros1.save()

        protype = producttype.objects.all().filter( protype_status=1 )
        manufct = manufctr.objects.all().filter( manu_status=1 )
        pros = product.objects.all().filter( pro_status=1 )
        cate = Category.objects.all().filter( cate_status=1 )
        return render( request, 'admin/admin_product.html',
                       {'protype': protype, 'manufct': manufct, 'pros': pros, 'cate': cate} )

    prodcts = product.objects.get( id=id )
    man = manufctr.objects.all()
    pross = producttype.objects.all()
    return render( request, "admin/admin_editproduct.html", {'prodcts': prodcts, 'man': man, 'pross': pross} )


def prodctdelete(request, id):
    pros2 = product.objects.get( id=id )
    pros2.delete()
    protype = producttype.objects.all().filter( protype_status=1 )
    manufct = manufctr.objects.all().filter( manu_status=1 )
    pros = product.objects.all().filter( pro_status=1 )
    cate = Category.objects.all().filter( cate_status=1 )
    return render( request, 'admin/admin_product.html',
                   {'protype': protype, 'manufct': manufct, 'pros': pros, 'cate': cate} )


# -----------------------------------------View Product Details------------------------------------


# ---------------------------------------Orders--------------------------------------------------
def orders(request):
    reg = register.objects.all()
    adres = adreess.objects.all()
    products = product.objects.all()
    pay = payment.objects.all()
    order1 = order.objects.all()
    return render( request, "admin/orders.html",
                   {'reg': reg, 'adres': adres, 'products': products, 'pay': pay,
                    'order1': order1} )



def updateorderpay(request,id):
    if request.method == 'POST':
        payid=payment.objects.get( id=id )
        payid.orderstatus=order.objects.get( id=request.POST.get( 'order_type' ) )
        payid.save()
        reg = register.objects.all()
        adres = adreess.objects.all()
        products = product.objects.all()
        pay = payment.objects.all()
        order1 = order.objects.all()
        return render( request, "admin/orders.html",
                       {'reg': reg, 'adres': adres, 'products': products, 'pay': pay,
                        'order1': order1} )


    orders = order.objects.all()
    pay=payment.objects.all()
    return render( request, "admin/admin_updateorder.html", {'orders': orders,'pay':pay} )


# ---------------------------------------------logout-------------------------------------------------
def logout(request):
    products = product.objects.all()
    cate = Category.objects.all().filter( cate_status=1 )
    return render( request, 'common/indexed.html', {'products': products, 'cate': cate} )
