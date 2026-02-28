# Base image com Python
FROM python:3.9-slim

# Instala dependências do sistema necessárias
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libssl-dev \
    libffi-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Define diretório de trabalho
WORKDIR /app

# Copia arquivos de requirements
COPY requirements.txt /app/

# Instala dependências Python (inclui Django e suporte a WebSocket)
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install channels channels-redis daphne

# Copia o código da aplicação (inclui manage.py)
COPY . /app/

# Expõe a porta usada pelo Django/Obico
EXPOSE 3334

# Comando padrão: iniciar servidor Django com suporte a WebSocket via Daphne
CMD ["daphne", "-b", "0.0.0.0", "-p", "3334", "obico.asgi:application"]
