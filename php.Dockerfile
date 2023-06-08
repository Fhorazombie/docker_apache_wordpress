FROM amazonlinux:2

RUN yum update

RUN amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN apt-get install -y git

RUN apt-get install nodejs -y && \
    apt-get install npm -y && \
    apt-get install vim -y

RUN echo "upload_max_filesize = 64M" >> /usr/local/etc/php/php.ini && \
    echo "post_max_size = 64M" >> /usr/local/etc/php/php.ini && \
    echo "memory_limit = 512M" >> /usr/local/etc/php/php.ini && \
    echo "max_execution_time = 600" >> /usr/local/etc/php/php.ini && \
    echo "max_input_vars = 3000" >> /usr/local/etc/php/php.ini