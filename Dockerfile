# Use slim Python 3.11 base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy training script and requirements
COPY scripts/train.py .
COPY requirement.txt .

# Install curl to download CSV
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Create data folder and download CSV
RUN mkdir -p data && \
    curl -o data/my_data.csv https://your-storage-link.com/my_data.csv

# Install Python dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Default command to run training
CMD ["python3", "train.py"]
