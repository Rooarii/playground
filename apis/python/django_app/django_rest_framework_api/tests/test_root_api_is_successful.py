from django.test import TestCase, Client


class ApiRootEndpointTestCase(TestCase):
    """
    TestCase: Get root endpoint
    Endpoint: http://localhost:8000/api/
    Typeof Test: Unit test
    """

    def test_status_code_is_successful(self):
        client = Client()
        response = client.get('/api/')
        self.assertEqual(response.status_code, 200)
