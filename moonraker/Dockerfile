FROM python:3.10-slim

# Instala dependências básicas e libs necessárias
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    libffi-dev \
    libssl-dev \
    libsodium-dev \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

# Clona o Moonraker
WORKDIR /opt
RUN git clone https://github.com/Arksine/moonraker.git

# Instala requisitos
WORKDIR /opt/moonraker
RUN pip install --no-cache-dir -r scripts/moonraker-requirements.txt

# Define diretório de configuração
WORKDIR /home/klipper/config

# Expõe a porta padrão do Moonraker
EXPOSE 7125

# Comando padrão
CMD ["python", "/opt/moonraker/moonraker/moonraker.py", "-c", "/home/klipper/config/moonraker.conf"]
