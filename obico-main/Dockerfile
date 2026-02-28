# Base: imagem oficial do Obico
FROM ghcr.io/imagegenius/obico:latest

# Define diretório de trabalho
WORKDIR /app

# Copia os arquivos extras (manage.py e requirements.txt)
COPY manage.py /app/manage.py
COPY requirements.txt /app/requirements.txt

# Instala pacotes do sistema úteis
RUN apt-get update && apt-get install -y \
    python3-pip \
    nano vim curl \
    && rm -rf /var/lib/apt/lists/*

# Instala dependências Python listadas em requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta para admin + WebSocket
EXPOSE 8000

# Comando padrão: roda o servidor ASGI com Daphne (HTTP + WebSocket)
CMD ["daphne", "-b", "0.0.0.0", "-p", "8000", "obico.asgi:application"]

