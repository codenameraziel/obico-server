import json
from channels.generic.websocket import AsyncWebsocketConsumer

class TestConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        # Aceita a conexão
        await self.accept()
        # Envia mensagem inicial
        await self.send(text_data=json.dumps({"message": "Conexão estabelecida!"}))

    async def disconnect(self, close_code):
        # Aqui você pode limpar recursos se precisar
        pass

    async def receive(self, text_data):
        # Recebe mensagem do cliente
        data = json.loads(text_data)
        message = data.get("message", "")
        # Ecoa de volta para o cliente
        await self.send(text_data=json.dumps({"echo": message}))
