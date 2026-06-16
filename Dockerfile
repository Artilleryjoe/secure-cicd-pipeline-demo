# syntax=docker/dockerfile:1.7

# ============================================
# Builder stage
# ============================================
FROM python:3.12-slim AS builder

WORKDIR /build

COPY app.py .

# (We'll add requirements.txt and pip install here later when the app grows)

# ============================================
# Final runtime stage
# ============================================
FROM python:3.12-slim

# Create a non-root user for security
RUN groupadd --system appgroup && \
    useradd --system --gid appgroup --create-home --home-dir /home/appuser appuser

WORKDIR /app

# Copy code from builder stage
COPY --from=builder /build/app.py .

# Switch to non-root user
USER appuser

# Run the application
CMD ["python", "app.py"]
