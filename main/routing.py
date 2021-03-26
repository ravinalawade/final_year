from django.urls import re_path, path
from . import consumers

websocket_urlpatterns = [
    # re_path(r'ws/chat/(?P<friendship_id>\w+)/$', consumers.ChatConsumer.as_asgi()),
    path('web_socket', consumers.Web_socket.as_asgi(), name='task_socket'),
    # path('alertnotify', consumers.Alertnotify.as_asgi(), name='alertnotify'),
]