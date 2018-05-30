FROM ubuntu AS simple-php-56

RUN apt-get update

RUN apt-get install -y \
			git \
			vim \
			software-properties-common \
			python-software-properties \
			curl

# Install nginx
RUN apt-get install -y nginx

# Install PHP
RUN LC_ALL=C.UTF-8 add-apt-repository -y -u ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y \
			php5.6-fpm \
			php5.6-cli \
			php5.6-common \
			php5.6-mbstring \
			php5.6-gd \
			php5.6-intl \
			php5.6-xml \
			php5.6-mysql \
			php5.6-pdo \
			php5.6-opcache \
			php5.6-zip \
			php5.6-dev \
			php5.6-curl

RUN mkdir -p /run/php

RUN sed -i -- "s/;clear_env = no/clear_env = no/g" /etc/php/5.6/fpm/pool.d/www.conf

# Install composer
RUN cd /opt && curl -sS https://getcomposer.org/installer -o composer-setup.php && php composer-setup.php --install-dir=/usr/bin --filename=composer && rm composer-setup.php

EXPOSE 80 443