FROM php:7.4-fpm

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN apt-get update -q \
 && apt-get -qq -y install curl zip unzip git

RUN install-php-extensions bcmath exif intl memcached pdo_mysql zip mbstring

RUN cd /tmp \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir="/bin" --filename=composer \
 && php -r "unlink('composer-setup.php');"
