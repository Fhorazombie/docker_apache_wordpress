FROM php:7.4.3-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql

# define timezone
RUN echo "America/Mexico_City" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN /bin/echo -e "LANG=\"en_US.UTF-8\"" > /etc/default/local

RUN apt-get update -y && apt-get install -y libpng-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev 

RUN docker-php-ext-install gd

RUN apt-get update && apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
	&& docker-php-ext-enable imagick

RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-configure zip \
  && docker-php-ext-install zip

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev

RUN docker-php-ext-install exif

RUN apt-get update && \
    apt-get install -y libxml2-dev

RUN docker-php-ext-install soap

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN apt-get install -y git

RUN apt-get install nodejs -y && \
    apt-get install npm -y && \
    apt-get install vim -y

RUN a2enmod rewrite
