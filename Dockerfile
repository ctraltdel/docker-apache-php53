FROM ubuntu:12.04
MAINTAINER Alexander Schenkel <alex@alexi.ch>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get install -y \
      apache2 \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-gd \
      php5-mcrypt \      
      php5-mysql 

# add memory to php
RUN sed -i s/128M/512M/g /etc/php5/apache2/php.ini

COPY apache_default /etc/apache2/sites-available/default
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
