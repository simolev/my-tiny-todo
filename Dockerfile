# Use an official PHP image with Apache as a base.
FROM php:8.2-apache

# Install system dependencies needed for the SQLite extension.
RUN apt-get update && \
    apt-get install -y \
    libsqlite3-dev \
    git \
    unzip

# Copy the application source code into the container's web directory.
COPY app /var/www/html/
COPY config.php /var/www/html/
RUN chown -R www-data:www-data /var/www/html/db/
RUN rm /var/www/html/config-sample.php

# Expose port 80 to allow external access to the web server.
EXPOSE 80

# This command is executed when the container starts.
CMD ["apache2-foreground"]
