# Usa a imagem base do Obico já publicada
FROM ghcr.io/imagegenius/obico:latest

# Instala dependências adicionais necessárias para WebSocket (Django Channels + Daphne)
RUN pip install --no-cache-dir \
    channels \
    channels-redis \
    daphne

# Define diretório de trabalho
WORKDIR /app

# Copia o código da aplicação (inclui manage.py e demais arquivos)
COPY . /app/

# Expõe a porta usada pelo Obico/Django
EXPOSE 3334

# Comando padrão: iniciar servidor ASGI com suporte a WebSocket
CMD ["daphne", "-b", "0.0.0.0", "-p", "3334", "obico.asgi:application"]
