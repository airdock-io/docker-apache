# VERSION 1.0
# AUTHOR:         Jerome Guibert <jguibert@gmail.com>
# DESCRIPTION:    Apache 2
# TO_BUILD:       docker build --rm -t airdock/apache .
# SOURCE:         https://github.com/airdock-io/docker-apache

# Pull base image.
FROM airdock/base:latest

MAINTAINER Jerome Guibert <jguibert@gmail.com>

RUN apt-get update -qq && \
	apt-get install -y -qq apache2 && \
	apt-get clean  && \
	rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/* && \
	mkdir -p /var/run/apache2 && \
	mkdir -p /var/log/apache2 && \
	mkdir -p /var/lock/apache2 && \
	chown -R www-data:www-data /var/run/apache2 /var/log/apache2 /var/lock/apache2 /var/www && \
	MODULE_LIST="cache.load cache_disk.conf cache_disk.load expires.load headers.load proxy.conf proxy.load proxy_http.load vhost_alias.load include.load  autoindex.load autoindex.conf"  && \
	for name in $MODULE_LIST; do \
  		if [ ! -e "/etc/apache2/mods-enabled/$name" ]; then ln -s /etc/apache2/mods-available/$name  /etc/apache2/mods-enabled/$name ; fi; \
	done;

# Add Configuration apache
ADD etc 		/etc

# define environment
ENV APACHE_RUN_USER 		www-data
ENV APACHE_RUN_GROUP 		www-data
ENV APACHE_PID_FILE 		/var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR 			/var/run/apache2
ENV APACHE_LOCK_DIR 		/var/lock/apache2
ENV APACHE_LOG_DIR 			/var/log/apache2
ENV APACHE_ULIMIT_MAX_FILES 'ulimit -n 65536'
ENV APACHE_SERVERNAME       fake.server.com

# declare volume
VOLUME ["/var/www"]

# Exposing ports
EXPOSE 80

# Entry point
CMD ["/usr/sbin/apache2", "-DFOREGROUND"]
