# Dockerfile
FROM ubuntu:latest

# Install Apache and PHP
RUN apt-get update \
    && apt-get install -y apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy your index.html into the Docker image
COPY index.html /var/www/html/

# Expose port 80 to the Docker host
EXPOSE 80

# Start Apache service on container startup
CMD ["apache2ctl", "-D", "FOREGROUND"]