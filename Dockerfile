# Dockerfile

FROM python:3.11-slim

WORKDIR /app

# Copy scripts, requirements, and data folder
COPY scripts/train.py .
COPY requirement.txt .
COPY data/ data/   # copy CSV inside Docker image

# Install Python dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Default command to run training
CMD ["python3", "train.py"]
