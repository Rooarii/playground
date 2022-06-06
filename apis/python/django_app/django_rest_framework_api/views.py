from django.http import JsonResponse


def api_home(request, *args, **kwargs):
    return JsonResponse(
        {
            "endpoint": "http://127.0.0.1:8000/api/",
            "message": "Welcome to Django Rest Framework!"
        }
    )

