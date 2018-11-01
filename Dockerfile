FROM netyazilim/alpine-base:3.8

LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"

EXPOSE 80
ENV PHP_INI "/etc/php5/php.ini"
ENV WEB_CONF "/etc/apache2/httpd.conf"

COPY entrypoint.sh /bin/entrypoint.sh
ADD *.php /var/www/localhost/htdocs/

RUN apk add --update --no-cache libressl apache2 php5-apache2 php5-bz2 php5-curl php5-iconv php5-json php5-mysqli php5-mysql php5-pdo_mysql php5-pdo_pgsql php5-pgsql php5-soap php5-xml php5-zip php5-zlib php5-cgi
RUN mkdir -p /run/apache2  
RUN sed -i 's/DirectoryIndex index\.html/DirectoryIndex index\.php/g' /etc/apache2/httpd.conf
RUN echo "ServerName localhost" >> /etc/apache2/httpd.conf
RUN sed -i '$ a PHPIniDir ${PHP_INI}' /etc/apache2/conf.d/php5-module.conf
RUN chmod +x /bin/entrypoint.sh

#CMD ["httpd", "-D", "FOREGROUND"]

ENTRYPOINT ["/bin/entrypoint.sh"]
