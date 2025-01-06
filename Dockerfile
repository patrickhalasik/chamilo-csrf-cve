FROM php:7.2-apache

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    libbz2-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libjpeg-dev \
    libldap2-dev \
    libmcrypt-dev \
    libpng-dev \
    libpq-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libzip-dev \
    unzip \
    wget \
    && apt-get clean \ 
    && docker-php-ext-install \
    gd \
    intl \
    zip pdo_mysql

# Copy Chamilo source code
COPY . /var/www/html/

# Install Composer and dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --working-dir=/var/www/html

# Set permissions
RUN chown -R www-data:www-data \
    /var/www/html/app \
    /var/www/html/main/default_course_document/images \
    /var/www/html/main/lang \
    /var/www/html/vendor \
    /var/www/html/web

# Configure Apache
COPY chamilo.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite \
    && service apache2 restart

# Expose ports and set entry point
EXPOSE 80
CMD ["apache2-foreground"]
