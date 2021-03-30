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
        data=[]
        ani=Animal.objects.all()
        for i in ani:
            a={}
            a["animal"]=i.animal_name
            a["id"]=i.animal_id
            temp=i.latitude
            a["latitude"]=temp[-1]
            temp=i.longitude
            a["longitude"]=temp[-1]
            data.append(a)
        se={"animals":data}
        async_to_sync(get_channel_layer().group_send)(
            "animal",
            {
                'type': 'coordinates',
                'message': json.dumps(se)
            }
        )
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
    def coordinates(self,event):
        print("Sending from server",event)
        self.send(text_data=event['message'])

    def alert_message(self,event):
        print("Sending from server",event)
        self.send(text_data=event['message'])

class Animal_socket(WebsocketConsumer):
    def connect(self):
        print("connecting animal")
        async_to_sync(get_channel_layer().group_add)(
            "animal",
            self.channel_name
        )
        self.accept()

    def receive(self,text_data):
        print("received data",text_data)
        d=json.loads(text_data)
        aid=d["id"]
        latitude=d["latitude"]
        longitude=d["longitude"]
        lat=Animal.objects.get(animal_id=aid).latitude
        lat.append(latitude)
        Animal.objects.filter(animal_id=aid).update(latitude=lat)
        lat=Animal.objects.get(animal_id=aid).longitude
        lat.append(longitude)
        Animal.objects.filter(animal_id=aid).update(longitude=lat)
        ani=Animal.objects.get(animal_id=aid)
        se={}
        se["animal"]=ani.animal_name
        se["id"]=aid
        se["latitude"]=latitude
        se["longitude"]=longitude
        async_to_sync(get_channel_layer().group_send)(
            "animal",
            {
                'type': 'coordinates',
                'message': json.dumps(se)
            }
        )

    def coordinates(self,event):
        print("Sending from server",event)
        self.send(text_data=event['message'])

