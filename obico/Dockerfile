# Base: imagem oficial do Obico
FROM ghcr.io/imagegenius/obico:latest

# Define diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY manage.py /app/manage.py
COPY requirements.txt /app/requirements.txt
COPY obico /app/obico

# Instala dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta usada pelo Daphne
EXPOSE 3334

# Comando padrão: roda o servidor ASGI com Daphne
CMD ["daphne", "-b", "0.0.0.0", "-p", "3334", "obico.asgi:application"]
