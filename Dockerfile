# Use the official Python base image
FROM python:3.11-slim-buster

# Set the working directory
WORKDIR /app

# Installing required packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y g++ && \
    apt-get install -y --no-install-recommends gcc python3-dev graphviz libgraphviz-dev

# Copy requirements.txt into the working directory
COPY requirements.txt requirements.txt

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the fastapi port
EXPOSE 8000

# Start the fastapi app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
