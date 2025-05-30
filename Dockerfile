
FROM python:3.10-slim


RUN apt-get update && \
    apt-get install -y \
      ffmpeg \
      tesseract-ocr \
      poppler-utils && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY . .



EXPOSE 7860


CMD ["python", "app.py"]
