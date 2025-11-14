# Dockerfile — production-grade Streamlit container
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev gcc && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy dependencies first (better caching)
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Make startup script executable
RUN chmod +x /app/start.sh

# Default port (Render overrides with $PORT)
EXPOSE 8501

CMD ["/app/start.sh"]
