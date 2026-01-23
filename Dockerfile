FROM python:3.11-slim 
WORKDIR /app 
COPY app.py . 
COPY wine_model.pkl . 
COPY requirement.txt . 
RUN pip install --no-cache-dir -r requirement.txt 
EXPOSE 8000 
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"] 

