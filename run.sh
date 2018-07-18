#!/bin/bash

charset=$(env|grep charset|cut -d"=" -f 2)

if [ ! -z "$charset" ] ; then
	sed -i "s/charset UTF-8/charset $charset/g" /etc/nginx/nginx.conf
fi
service php5-fpm start
service nginx start

bash