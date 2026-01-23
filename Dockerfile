FROM python:3.11-slim

WORKDIR /app

# Copy model and requirements
COPY artifacts/model.pkl wine_model.pkl

COPY requirement.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Placeholder command
CMD ["echo", "Model image is ready!"]



