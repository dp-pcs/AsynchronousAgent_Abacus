
# Multi-stage Dockerfile for the monorepo
FROM node:20-alpine AS frontend-builder

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY apps/web/package*.json ./apps/web/
COPY libs/shared/package*.json ./libs/shared/

# Install dependencies
RUN npm ci

# Copy source code
COPY apps/ ./apps/
COPY libs/ ./libs/

# Build frontend
RUN npm -w apps/web run build

# Python API stage
FROM python:3.12-slim AS api

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY services/api/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy API source
COPY services/api/ .

# Create non-root user
RUN useradd --create-home --shell /bin/bash app
USER app

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/healthz || exit 1

# Expose port
EXPOSE 8000

# Start the API server
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
