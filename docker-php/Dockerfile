# see also https://gitlab.com/pkp-org/docker/ojs/-/blob/main/templates/dockerFiles/Dockerfile-alpine-apache-php74.template

FROM php:7.4-fpm-alpine
WORKDIR /var/www/html

# PHP extensions
# the php extensions are installed with docker-php-ext-install (see https://hub.docker.com/_/php)
# these extensions are not preinstalled in the php-fpm docker image
# the "persistent" and "volatile" dependencies are borrowed from
# https://github.com/mlocati/docker-php-extension-installer/blob/master/install-php-extensions
# of all the packages, php-mbstring, php-xml, php-intl, and mysqli driver are absolutely necessary
# the rest were copied from the templates and are here "just in case"
ARG PACKAGES_PERSISTENT="ttf-freefont libbz2 libintl icu-libs icu-data-full libzip"
ARG PACKAGES_VOLATILE="bzip2-dev gettext-dev icu-dev cmake gnutls-dev libzip-dev zlib-dev libretls-dev"
ARG PHP_EXTENSIONS="bcmath bz2 calendar exif gettext intl mysqli opcache pdo_mysql shmop sockets zip"

RUN set -xe \
# Add apps and PHP extensions (the recommended way)
    && apk add --no-cache $PACKAGES_PERSISTENT $PACKAGES_VOLATILE \
    && docker-php-ext-install bcmath bz2 calendar exif gettext intl mysqli opcache pdo_mysql shmop sockets zip \
    && apk del --no-cache --purge $PACKAGES_VOLATILE \
# Prepare freefont for captcha
	&& ln -s /usr/share/fonts/TTF/FreeSerif.ttf /usr/share/fonts/FreeSerif.ttf \
# Prepare crontab
	&& echo "0 * * * *   php /var/www/html/tools/runScheduledTasks.php" | crontab -