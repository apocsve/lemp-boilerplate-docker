#!/bin/bash
set -e

chmod -R 777 /var/www/html

supervisord -c /etc/supervisord.conf