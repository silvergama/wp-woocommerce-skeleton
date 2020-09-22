FROM wordpress:latest
LABEL "email"="silver.mdg@gmail.com" version="1.0.0"

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp-cli.phar && \
    echo '#!/bin/sh' >> /usr/local/bin/wp && \
    echo 'wp-cli.phar "$@" --allow-root' >> /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

RUN a2enmod rewrite
# install and configure XDebug
RUN yes | pecl install xdebug && \
    echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.idekey=netbeans-xdebug" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_host=docker.for.mac.localhost" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_log=/tmp/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/xdebug.ini

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
