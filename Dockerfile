FROM python:3.10.0-slim

# Установка необходимых системных библиотек
RUN apt-get update && apt-get install -y --no-install-recommends \
build-essential \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]