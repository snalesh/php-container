FROM php:7.4-fpm

RUN apt-get update -q \
 && apt-get -qq -y install curl zip unzip git libicu-dev libzip-dev libonig-dev

RUN docker-php-ext-install bcmath exif json intl pdo_mysql zip mbstring

RUN cd /tmp \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir="/bin" --filename=composer \
 && php -r "unlink('composer-setup.php');"
