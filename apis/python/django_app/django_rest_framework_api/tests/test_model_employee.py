from django.test import TestCase
from ..models import Employee


class EmployeeModelTest(TestCase):

    def test_employee_model_has_right_properties(self):

        attributes = {'salary', 'joining_date', 'first_name', 'last_name', 'Dept_name'}
        # print(vars(attributes))

        for attribute in attributes:
            self.assertTrue(
                hasattr(Employee(), attribute
                        ))
