from django.db import models

# Create your models here.


from adminapp.models import product
from userapp.models import register

class order(models.Model):
    order_status=models.CharField(max_length=150)

class payment( models.Model ):
    amount = models.BigIntegerField()
    userid=models.ForeignKey(register,on_delete=models.CASCADE)
    proid=models.ForeignKey(product,on_delete=models.CASCADE)
    payment_id = models.CharField( max_length=100 )
    paid = models.BooleanField( default=False )
    orderstatus=models.ForeignKey(order,on_delete=models.CASCADE,default=1)

#class orderpay(models.Model):
    #order_id=models.ForeignKey(order,on_delete=models.CASCADE)
    #pay=models.ForeignKey(payment,on_delete=models.CASCADE)