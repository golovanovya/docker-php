FROM php:7.3-fpm
RUN apt update
RUN apt install unixodbc-dev -y
RUN pecl install sqlsrv
RUN pecl install pdo_sqlsrv
RUN echo extension=sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/30-pdo_sqlsrv.ini
RUN echo extension=pdo_sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/30-pdo_sqlsrv.ini
RUN docker-php-ext-install pdo_mysql
RUN apt update
RUN apt install libpng-dev -y
RUN apt install libfreetype6-dev -y
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ \
    && docker-php-ext-install gd
RUN pecl install xdebug-beta
RUN echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini
RUN apt install gnupg2 apt-transport-https ca-certificates -y
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt update
RUN ACCEPT_EULA=Y apt install msodbcsql17 -y
