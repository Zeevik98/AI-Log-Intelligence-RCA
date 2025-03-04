# ---------------------
# 1) Builder Stage
# ---------------------
    FROM python:3.9-slim as builder
    WORKDIR /builder
    COPY requirements.txt .
    RUN pip install --no-cache-dir -r requirements.txt --target /builder/deps
    COPY nlp_main.py .
    
    # ---------------------
    # 2) Final Stage
    # ---------------------
    FROM python:3.9-slim
    WORKDIR /app
    COPY --from=builder /builder/deps /app/deps
    COPY nlp_main.py /app/nlp_main.py
    ENV PYTHONPATH=/app/deps
    CMD ["python", "/app/nlp_main.py"]
    