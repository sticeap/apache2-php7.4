FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
# Install system dependencies
RUN apt-get update && apt-get install -y \
    apache2 git curl wget zip unzip php8.1 php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl php-mbstring php8.1-mysql php-fpm php-xml

RUN apt-get install libapache2-mod-php8.1
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
# RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
RUN a2enmod proxy_fcgi setenvif && a2enmod php8.1 && a2enmod rewrite && a2enmod headers
