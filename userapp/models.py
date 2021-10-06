from django.db import models

# Create your models here.
from adminapp.models import country


class login(models.Model):
    usr_email=models.EmailField()
    usr_passw=models.CharField(max_length=150)
    usr_role=models.IntegerField(default=1) #0 - admin      1 - user

class register(models.Model):
    usr_loginid=models.ForeignKey(login,on_delete=models.CASCADE)
    usr_name=models.CharField(max_length=150)
    usr_gender=models.IntegerField()
    #usr_phone=models.CharField(max_length=150)


class adreess(models.Model):
    ad_state=models.CharField(max_length=150)
    ad_adres1=models.CharField(max_length=150)
    ad_adres2=models.CharField(max_length=150)
    ad_town=models.CharField(max_length=150)
    ad_pin=models.BigIntegerField()
    ad_phone=models.BigIntegerField()
    ad_userid=models.ForeignKey(register,on_delete=models.CASCADE)
    ad_countryid=models.ForeignKey(country,on_delete=models.CASCADE)
