FROM python:3.11-slim

WORKDIR /app

COPY app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN useradd --create-home --shell /bin/bash servicio

COPY app/ ./

USER servicio

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "servidor:app"]