FROM php:7.1.2-cli

MAINTAINER Luis Rovirosa <luisrovirosa@gmail.com>

# Composer and dependencies
RUN apt-get update && \
    apt-get install git unzip -y
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

# Volume to have access to the source code
VOLUME ["/opt/project"]

WORKDIR /opt/project