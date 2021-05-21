# Base Image UBUNTU 18.04
FROM ubuntu:18.04

LABEL mantainer="Rafael <rafael@booug.com>"

# Working directory as root
USER root
WORKDIR "/root"

# No prompts please
ENV DEBIAN_FRONTEND=noninteractive

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

# Perform Installations
COPY docker-runs.sh /root/
RUN sed -i'' 's/archive\.ubuntu\.com/us\.archive\.ubuntu\.com/' /etc/apt/sources.list
RUN /root/docker-runs.sh

VOLUME /var/www
VOLUME /root/scripts
VOLUME /etc/nginx/global

RUN mkdir -p /var/www/scripts

# Copying neccessary files

## NGINX Conf
COPY ./nginx/app.conf /etc/nginx/conf.d/app.conf


## PHP Conf
COPY ./php/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY ./php/xdebug.ini /etc/php/7.3/fpm/conf.d/20-xdebug.ini

## Supervisor
COPY ./supervisord/supervisord.conf /etc/supervisord.conf

## Docker scripts
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY wait.sh /usr/local/bin/wait.sh

ENTRYPOINT wait.sh && docker-entrypoint.sh

EXPOSE 8080