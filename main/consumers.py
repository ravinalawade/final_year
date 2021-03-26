import json
from asgiref.sync import async_to_sync
from channels.generic.websocket import WebsocketConsumer
from channels.layers import get_channel_layer
from rest_framework.permissions import IsAuthenticated 
from django.contrib.sessions.models import Session
from rest_framework.authtoken.models import Token
from .models import *

class Web_socket(WebsocketConsumer):
    def connect(self):
        # Join room group
        print("connecting")
        # emp=request.session['empid']
        
        async_to_sync(get_channel_layer().group_add)(
            "alert",
            self.channel_name
        )
        self.accept()

    def disconnect(self, close_code):
        # Leave room group
        async_to_sync(self.channel_layer.group_discard)(
            "alert",
            self.channel_name
        )

    # Receive message from WebSocket
    def receive(self, text_data):
        print("recieving",text_data)
        token=text_data
        s=Token.objects.get(key=token).user
        print(s)
        data=Forest_employee.objects.get(user=s)
        data=data.empid+"-"+data.name
        print(data)
        async_to_sync(get_channel_layer().group_add)(
            data,
            self.channel_name
        )
        # text_data_json = json.loads(text_data)
        # message = text_data_json

        # Send message to room group
        # async_to_sync(self.channel_layer.group_send)(
        #     "pratik",
        #     {
        #         'type': 'chat_message',
        #         'message': text_data + " from ravi"
        #     }
        # )

    # # Receive message from room group
    def task_message(self, event):
        print("task message",event)
        # message=event['message']
        # Send message to WebSocket
        # message["message"]+=" from Ravi"
        self.send(text_data=event['message'])
    
    def send_message(self,event):
        print("Sending from server",event)
        self.send(text_data=event['message'])

# class Alertnotify(WebsocketConsumer):
#     def connect(self):
#         print("routing perfect")
#         permission_classes = (IsAuthenticated,)
#         print("connecting")
        # async_to_sync(get_channel_layer().group_add)(
        #     "alert",
        #     self.channel_name
        # )
#         ##Connected to alert room
#         self.accept()

    def alert_message(self,event):
        print("Sending from server",event)
        self.send(text_data=event['message'])