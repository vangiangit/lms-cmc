#!/bin/bash

# Start cron
service cron start

# Start PHP-FPM
php-fpm -g "daemon off;"