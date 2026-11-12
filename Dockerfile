FROM python:3.11-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/servidor.py .

RUN useradd --create-home --shell /bin/bash servicio

USER servicio

EXPOSE 8000

CMD ["python", "servidor.py"]