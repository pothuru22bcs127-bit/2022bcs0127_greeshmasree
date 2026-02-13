FROM python:3.11-slim

WORKDIR /app

# Copy training script and requirements
COPY scripts/train.py .
COPY requirement.txt .

# Copy only the CSV file
COPY data/winequality-red.csv data/winequality-red.csv

# Install Python dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Default command to run training
CMD ["python3", "train.py"]
