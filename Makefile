# Makefile for AsynchronousAgent_Abacus

.PHONY: help install test build clean docker-build docker-up docker-down lint audit

# Default target
help:
	@echo "Available targets:"
	@echo "  install      - Install all dependencies"
	@echo "  test         - Run all tests"
	@echo "  build        - Build all components"
	@echo "  clean        - Clean build artifacts"
	@echo "  docker-build - Build Docker images"
	@echo "  docker-up    - Start services with Docker Compose"
	@echo "  docker-down  - Stop Docker Compose services"
	@echo "  lint         - Run linting checks"
	@echo "  audit        - Run security audits"

# Install dependencies
install:
	npm ci
	cd services/api && pip install -r requirements.txt

# Run tests
test:
	npm test
	cd services/api && PYTHONPATH=. pytest tests/ -v

# Build components
build:
	npm -w apps/web run build

# Clean build artifacts
clean:
	rm -rf apps/web/.next
	rm -rf libs/shared/dist
	find . -name "node_modules" -type d -exec rm -rf {} + 2>/dev/null || true
	find . -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true
	find . -name "*.pyc" -delete 2>/dev/null || true

# Docker operations
docker-build:
	docker build -t agent-benchmark:latest .

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

# Linting and code quality
lint:
	@echo "Running TypeScript checks..."
	npx tsc --noEmit -p apps/web/tsconfig.json
	npx tsc --noEmit -p libs/shared/tsconfig.json

# Security audits
audit:
	npm audit --audit-level=moderate
	cd services/api && pip-audit --desc

# Development server
dev-api:
	cd services/api && PYTHONPATH=. uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

dev-web:
	npm -w apps/web run dev

# Integration test
integration-test:
	@echo "Starting API server..."
	cd services/api && PYTHONPATH=. uvicorn app.main:app --host 0.0.0.0 --port 8001 &
	@sleep 5
	@echo "Running integration tests..."
	curl -f http://localhost:8001/healthz || (echo "Health check failed" && exit 1)
	curl -X POST -H "Content-Type: application/json" -d '{"question":"test","answer":"test"}' http://localhost:8001/quiz/create || (echo "Quiz endpoint test failed" && exit 1)
	@echo "Integration tests passed!"
	@pkill -f "uvicorn app.main:app" || true
