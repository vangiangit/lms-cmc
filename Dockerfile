FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    libzip-dev \
    libpng-dev \
    libicu-dev \
    libpq-dev \
    libxml2-dev \
    unzip \
    libldap2-dev \
    telnet \
    iputils-ping \
    vim \
    cron \
    redis \
    libxslt1.1 \
    libxslt-dev \
    libxml2-dev \
    nginx \
    && docker-php-ext-install -j$(nproc) \
    zip \
    gd \
    intl \
    pgsql \
    pdo_pgsql \
    soap \
    opcache \
    exif \
    ldap \
    xsl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "max_input_vars = 5000" >> /usr/local/etc/php/conf.d/moodle-vars.ini \
    && echo "memory_limit = 512M" >> /usr/local/etc/php/conf.d/moodle-vars.ini \
    && echo "max_execution_time = 300" >> /usr/local/etc/php/conf.d/moodle-vars.ini \
    && echo "max_input_time = 300" >> /usr/local/etc/php/conf.d/moodle-vars.ini \
    && echo "post_max_size = 5150M" >> /usr/local/etc/php/conf.d/moodle-vars.ini \
    && echo "upload_max_filesize = 5G" >> /usr/local/etc/php/conf.d/moodle-vars.ini

RUN echo "* * * * * /usr/local/bin/php /var/www/html/admin/cli/cron.php >> /var/log/cron.log 2>&1" > /etc/cron.d/moodle-cron

RUN chmod 0644 /etc/cron.d/moodle-cron && crontab /etc/cron.d/moodle-cron

# Redis
RUN echo "extension=redis.so\n\
    session.save_handler=redis\n\
    session.save_path=\"tcp://localhost:6379\"\n" > /usr/local/etc/php/conf.d/redis.ini

#OPCache
RUN echo "opcache.enable=1\n\
    opcache.memory_consumption=128\n\
    opcache.interned_strings_buffer=8\n\
    opcache.max_accelerated_files=10000\n\
    opcache.revalidate_freq=60\n\
    opcache.validate_timestamps=1\n" > /usr/local/etc/php/conf.d/opcache.ini

WORKDIR /var/www/html

RUN pecl install redis && docker-php-ext-enable redis

COPY moodle_core/ .
COPY moodle_plugins/ .
COPY config.php .

RUN chown -R www-data:www-data /var/www/html

RUN mkdir -p /var/www/moodledata
COPY custom_lang/ /var/www/moodledata/lang/
RUN chown -R www-data:www-data /var/www/moodledata \
    && chmod 755 /var/www/moodledata

COPY config/nginx.conf /etc/nginx/sites-available/default

COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["/usr/local/bin/entrypoint.sh"]