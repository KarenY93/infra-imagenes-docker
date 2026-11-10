FROM python:3.11-slim

# Directorio de trabajo dentro de la imagen
WORKDIR /app

# Primero solo las dependencias, para aprovechar la caché
COPY app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Usuario sin privilegios 
RUN useradd --create-home --shell /bin/bash servicio

# Después el código, que es lo que más cambia
COPY app/ ./

# Todo lo que sigue, y el proceso, corre como "servicio"
USER servicio

# Documenta el puerto 
EXPOSE 8000

# Forma exec; gunicorn escucha en 0.0.0.0:8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "servidor:app"]