# Base na imagem oficial do Obico
FROM obico/obico:latest

# Instalar dependências extras para WebSocket/ASGI
RUN pip install --no-cache-dir django channels daphne

WORKDIR /app
COPY . /app

EXPOSE 3334

# Comando padrão: servidor ASGI com Daphne
CMD ["daphne", "-b", "0.0.0.0", "-p", "3334", "obico.asgi:application"]
