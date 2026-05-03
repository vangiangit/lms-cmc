#!/bin/bash

# Start cron
service cron start

# Start PHP-FPM
php-fpm &

# Start Nginx
nginx -g "daemon off;"

# Start Redis
service redis-server start
redis-server --daemonize yes