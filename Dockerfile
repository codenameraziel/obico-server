FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar requirements.txt da pasta local obico
COPY requirements.txt /app/requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copiar o restante do código do projeto (incluindo manage.py)
COPY . /app

EXPOSE 3334

CMD ["gunicorn", "obico.wsgi:application", \
     "--bind", "0.0.0.0:3334", \
     "--workers", "3", \
     "--worker-class", "gevent", \
     "--timeout", "120"]
