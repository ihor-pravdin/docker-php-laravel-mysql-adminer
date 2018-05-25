FROM php:7.2-fpm

ARG APP_NAME
ARG APP_PORT

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH $PATH:/root/.composer/vendor/bin

ENV APP_NAME $APP_NAME
ENV APP_PORT $APP_PORT

VOLUME ["/var/www"]

EXPOSE $APP_PORT

WORKDIR /var/www/$APP_NAME

# INSTALL SOFT AND PHP MODULES
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg2 \
    ca-certificates \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev && \
    docker-php-ext-install -j$(nproc) \
    zip \
    pdo_mysql

# INSTALL NODE JS 
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

# INSTALL COMPOSER
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

# INSTALL LARAVEL
RUN composer global require laravel/installer

CMD php artisan serve --host php --port $APP_PORT