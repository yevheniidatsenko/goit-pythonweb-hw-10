# Select the base image
FROM python:3.13-slim

# Install necessary system packages for Poetry and dependency compilation
RUN apt-get update && apt-get install -y gcc curl

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
ENV PATH="/root/.local/bin:$PATH"

# Create and move to the working directory
WORKDIR /src

# Copy project files to the container
COPY . /src

# Install dependencies via Poetry
RUN poetry install --no-interaction --no-dev

# Expose the port that the application will use
EXPOSE 8000

# Start the server
CMD ["python3", "main.py"]