from django.db import models


# Create your models here.



class manufctr( models.Model ):
    manu_name = models.CharField( max_length=150 )
    manu_location = models.CharField( max_length=150 )
    manu_status = models.IntegerField( default=1 )


class Category( models.Model ):
    cate_name = models.CharField( max_length=150 )
    cate_status = models.IntegerField( default=1 )


class producttype( models.Model ):
    protype_name = models.CharField( max_length=150 )
    protype_short = models.CharField( max_length=150 )
    protype_status = models.IntegerField( default=1 )
    cat = models.ForeignKey( Category, on_delete=models.CASCADE )


class product( models.Model ):
    pro_name = models.CharField( max_length=150 )
    protype = models.ForeignKey( producttype, on_delete=models.CASCADE )
    manuf = models.ForeignKey( manufctr, on_delete=models.CASCADE )
    pro_spec = models.CharField( max_length=400 )
    pro_color = models.CharField( max_length=100 )
    pro_price = models.BigIntegerField()
    pro_stock = models.IntegerField()
    pro_image = models.ImageField( upload_to='images', default='images/Image-Not-Available.png' )
    pro_status = models.IntegerField( default=1 )


class country( models.Model ):
    country_name = models.CharField( max_length=150 )

