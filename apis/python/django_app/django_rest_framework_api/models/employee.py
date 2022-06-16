from django.db import models


class Employee(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    Dept_name = models.CharField(max_length=20)
    joining_date = models.DateField()
    salary = models.IntegerField()
