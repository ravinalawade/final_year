import json
from asgiref.sync import async_to_sync
from channels.generic.websocket import WebsocketConsumer
from channels.layers import get_channel_layer

class Websocket(WebsocketConsumer):
    # def connect(self):
    #     print("connecting",self.channel_name)
    #     self.accept()

    # def disconnect(self, close_code):
    #     print("disconnecting")
    #     pass

    # def receive(self, text_data):
    #     print("rec",text_data)
    #     self.send(text_data=json.dumps({
    #         'message': 123
    #     }))

    # def __init__(self):
    #     self.room_group_name = "ravi"
    #     print("constructor")
    #     print(get_channel_layer())

    def connect(self):
        # Join room group
        print("connecting")
        async_to_sync(get_channel_layer().group_add)(
            "pratik",
            self.channel_name
        )
        self.accept()

    def disconnect(self, close_code):
        # Leave room group
        async_to_sync(self.channel_layer.group_discard)(
            "pratik",
            self.channel_name
        )

    # Receive message from WebSocket
    def receive(self, text_data):
        print("recieving",text_data)
        # text_data_json = json.loads(text_data)
        # message = text_data_json

        # Send message to room group
        async_to_sync(self.channel_layer.group_send)(
            "pratik",
            {
                'type': 'chat_message',
                'message': text_data + " from ravi"
            }
        )

    # # Receive message from room group
    def chat_message(self, event):
        print("chat message",event)
        # message=event['message']
        # Send message to WebSocket
        # message["message"]+=" from Ravi"
        self.send(text_data=event['message'])
    
    def send_message(self,event):
        print("Sending from server",event)
        self.send(text_data=event['message'])