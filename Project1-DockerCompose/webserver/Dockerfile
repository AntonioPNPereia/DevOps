FROM php:7.4-apache

COPY ./website/ /var/www/html/

# Install mysqli
RUN docker-php-ext-install mysqli

# Expose port 80 for HTTP
EXPOSE 80

# Start the Apache web server
CMD ["apache2-foreground"]