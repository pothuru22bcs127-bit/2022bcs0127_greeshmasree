FROM python:3.11-slim

WORKDIR /app

# Copy scripts and requirements
COPY scripts/train.py .
COPY requirement.txt .

# Optional: download data at build time (replace URL with your CSV location)
# This avoids committing large CSV files to GitHub
RUN mkdir -p data && \
    curl -o data/my_data.csv https://your-storage-link.com/my_data.csv

# Install dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Default command
CMD ["python3", "train.py"]
