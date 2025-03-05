# Use an official Python image
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Install system dependencies required for compiling Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose the port Flask will run on
EXPOSE 5050

# Command to run the app
CMD ["python", "app.py"]
