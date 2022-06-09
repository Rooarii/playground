from django.test import TestCase, Client


class ApiRootEndpointTestCase(TestCase):
    """
    TestCase: Get root endpoint
    Endpoint: http://localhost:8000/api/
    Typeof Test: Unit test
    """

    def test_response_corresponds_to_the_expected_data(self):
        client = Client()
        response = client.get('/api/')

        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            {
                "endpoint": "http://127.0.0.1:8000/api/",
                "message": "Welcome to Django Rest Framework!"
            }
        )
