FROM ubuntu:14.04

MAINTAINER Norman Radtke <radtke@informatik.uni-leipzig.de>
MAINTAINER Georges Alkhouri <georges.alkhouri@gmail.com>
MAINTAINER Natanael Arndt <arndt@informatik.uni-leipzig.de>
MAINTAINER Thomas Riechert <thomas.riechert@htwk-leipzig.de>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# install dependencies
RUN apt-get install -y libldap-2.4-2 libssl1.0.0 unixodbc wget make git nginx-light curl \
    php5 php5-fpm php5-common php5-cli \
    php5-odbc php5-curl

# install OntoWiki
RUN rm -rf /var/www/*
RUN git clone -b develop https://github.com/AKSW/OntoWiki.git /var/www/
RUN cd /var/www/ && make getcomposer && make deploy
RUN cp /var/www/config.ini.dist /var/www/config.ini

# configure the OntoWiki site for Nginx
COPY ontowiki-nginx.conf /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/ontowiki-nginx.conf /etc/nginx/sites-enabled/

#config php
RUN echo "upload_max_filesize = 100M" >> /etc/php5/fpm/php.ini
RUN echo "post_max_size = 100M" >> /etc/php5/fpm/php.ini
RUN echo "request_terminate_timeout = 3600" >> /etc/php5/fpm/php.ini

# Add virtuoso odbc dependency for OntoWiki to me able to connecto to virtuoso
ADD libvirtodbc0_7.2_amd64.deb /
RUN dpkg -i libvirtodbc0_7.2_amd64.deb

# configure odbc for virtuoso
ADD odbc.ini /etc/

# Add startscript and start
ADD ow-docker.fig /ow-docker.fig

EXPOSE 80
VOLUME /config

COPY run.sh /bin/

CMD ["run.sh"]
