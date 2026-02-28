from django.urls import re_path
from . import consumers

websocket_urlpatterns = [
    # rota de teste para WebSocket
    re_path(r"ws/test/$", consumers.TestConsumer.as_asgi()),
]
