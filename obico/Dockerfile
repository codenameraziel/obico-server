# Usa diretamente a imagem oficial do Obico
FROM ghcr.io/imagegenius/obico:latest

# Define diretório de trabalho
WORKDIR /app

# Copia arquivos locais (se você tiver customizações, senão pode omitir)
COPY . /app/

# Expõe a porta padrão do Obico
EXPOSE 3334

# Mantém o comando padrão da imagem (Gunicorn)
CMD ["gunicorn", "-b", "0.0.0.0:3334", "obico.wsgi:application"]
