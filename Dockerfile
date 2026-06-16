FROM python:3.12-slim

WORKDIR /app

#Copy Python file into the container
COPY app.py

#Run the script when the container starts
CMD ["python", "app.py"]
