FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN opentelemetry-bootstrap -a install
COPY app/ ./app/
WORKDIR /app/app
ENV OTEL_LOGS_EXPORTER=console
ENV OTEL_METRICS_EXPORTER=console
ENV OTEL_TRACES_EXPORTER=console

EXPOSE 8000
CMD ["opentelemetry-instrument", "gunicorn", "-c", "gunicorn.conf.py", "main:app"]

