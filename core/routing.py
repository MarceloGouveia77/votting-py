from django.urls import re_path, path

from . import consumers

websocket_urlpatterns = [
    #re_path(r'ws/(?P<room_name>)/(?P<name>)/$', consumers.ChatConsumer),
    path('ws/<str:room_name>/<str:name>/', consumers.ChatConsumer),
]