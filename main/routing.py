from django.urls import re_path, path
from . import consumers

websocket_urlpatterns = [
    # re_path(r'ws/chat/(?P<friendship_id>\w+)/$', consumers.ChatConsumer.as_asgi()),
    path('web_socket', consumers.Web_socket.as_asgi(), name='web_socket'),
    path('animal_socket', consumers.Animal_socket.as_asgi(), name='animal_socket')
    # path('alertnotify', consumers.Alertnotify.as_asgi(), name='alertnotify'),
]