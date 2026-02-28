# Base: imagem oficial do Obico
FROM ghcr.io/imagegenius/obico:latest

# Instala dependências necessárias para WebSocket e utilitários extras
RUN apt-get update && apt-get install -y \
    python3-pip \
    nano vim curl \
    && rm -rf /var/lib/apt/lists/*

# Instala Django Channels e Daphne (suporte WebSocket)
RUN pip install --no-cache-dir channels channels-redis daphne

# Define diretório de trabalho
WORKDIR /app

# Copia manage.py (se não estiver presente na imagem base)
# Caso já exista, essa linha pode ser removida
COPY manage.py /app/manage.py

# Expõe a porta para o painel admin e WebSocket
EXPOSE 8000

# Comando padrão: roda o servidor ASGI com Daphne
CMD ["daphne", "-b", "0.0.0.0", "-p", "8000", "obico.asgi:application"]
