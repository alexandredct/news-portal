FROM php:7.4.6-apache
LABEL maintainer="alexandredct@gmail.com"

RUN rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

RUN apt update

RUN apt install -y \
    apt-utils \
    zlib1g-dev \
    libicu-dev \
    g++ \
    && docker-php-ext-install intl

RUN docker-php-ext-install pdo

RUN apt install -y libpq-dev
RUN docker-php-ext-install pgsql pdo_pgsql

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN a2enmod rewrite

COPY webserver/apache-config.conf /etc/apache2/sites-enabled/000-default.conf
COPY webserver/apache2.conf /etc/apache2/apache2.conf
COPY webserver/php.ini /usr/local/etc/php/php.ini

COPY --from=composer:2.0.13 /usr/bin/composer /usr/local/bin/composer
RUN apt install -y \
    zip \
    unzip

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV HTDOCS /var/www/html
WORKDIR $HTDOCS
VOLUME $HTDOCS

EXPOSE 80
#USER www-data
ENTRYPOINT [ "sh", "-c", "chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP $HTDOCS/src && chmod -R +w $HTDOCS/src/writable && /usr/sbin/apache2ctl -D FOREGROUND"]
