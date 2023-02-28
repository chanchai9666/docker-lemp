FROM php:7.4-apache
# FROM php:7.4-fpm-alpine
# FROM php:7.4-fpm


RUN apt-get update

RUN apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++\
    libzip-dev\
    libonig-dev

RUN sudo a2enmod rewrite

# RUN docker-php-ext-install \
#     bz2 \
#     intl \
#     iconv \
#     bcmath \
#     opcache \
#     calendar \
#     mbstring \
#     pdo_mysql \
#     zip 
    # gd \
    #mysqli 
    # exif \
    # tidy

RUN docker-php-ext-install bz2
RUN docker-php-ext-install intl
RUN docker-php-ext-install iconv
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install opcache
RUN docker-php-ext-install calendar
# RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip 


# ICE 20/09/64 php install ext pgsql
RUN apt-get update && apt-get -y install git unzip zlib1g-dev libpq-dev
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo pdo_pgsql

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

COPY config/php.ini /usr/local/etc/php/