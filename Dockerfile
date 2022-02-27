FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
# Install system dependencies
RUN apt-get update && apt-get install -y \
    git curl wget zip unzip php8.0 php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-intl php-mbstring php8.1-mysql php-fpm php-xml

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
# RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
RUN a2enmod proxy_fcgi setenvif && a2enmod php8.0 && a2enmod rewrite && a2enmod headers
