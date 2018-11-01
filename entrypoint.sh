#!/bin/sh

cp -u /etc/php5/php.ini ${PHP_INI}
cp -u /etc/apache2/httpd.conf ${WEB_CONF}

/usr/sbin/httpd -D FOREGROUND -f ${WEB_CONF}