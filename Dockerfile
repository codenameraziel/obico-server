FROM python:3.10-slim

# Dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar requirements do Obico
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código do Obico
COPY . /app

EXPOSE 3334

# Rodar servidor ASGI com Daphne
CMD ["daphne", "-b", "0.0.0.0", "-p", "3334", "obico.asgi:application"]
