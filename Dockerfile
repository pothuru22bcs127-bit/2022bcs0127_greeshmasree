FROM python:3.11-slim

WORKDIR /app

# Copy scripts, requirements, and data
COPY scripts/train.py .
COPY requirement.txt .
COPY data/ data/   # <-- Add this line to include your CSV file

# Install dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Default command
CMD ["python3", "train.py"]
