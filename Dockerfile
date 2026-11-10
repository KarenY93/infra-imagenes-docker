FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

RUN useradd --create-home --shell /bin/bash servicio

USER servicio

EXPOSE 8000

CMD ["python", "servidor.py"]