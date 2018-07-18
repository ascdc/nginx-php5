FROM ubuntu:trusty
MAINTAINER ASCDC <asdc.sinica@gmail.com>

ADD run.sh /run.sh

RUN DEBIAN_FRONTEND=noninteractive && \
	chmod +x /*.sh && \
	apt-get update && \
	apt-get -y install software-properties-common python-software-properties && \
	locale-gen en_US.UTF-8 && \
	export LANG=en_US.UTF-8 && \
	apt-get -y upgrade && \
	apt-get update;apt-get install nginx nano php5-fpm php5-mcrypt php5-mysql imagemagick -y && \
	php5enmod mcrypt && \
	mkdir /lock;chmod 777 /lock;chmod o+t /lock

EXPOSE 80
WORKDIR /var/www/html
ENTRYPOINT ["/run.sh"]
