# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy app files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 80

# Run app
CMD ["python", "app.py"]

