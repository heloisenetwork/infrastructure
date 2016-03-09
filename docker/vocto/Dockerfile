FROM ubuntu:14.04

MAINTAINER Norman Radtke <radtke@informatik.uni-leipzig.de>
MAINTAINER Georges Alkhouri <georges.alkhouri@gmail.com>
MAINTAINER Natanael Arndt <arndt@informatik.uni-leipzig.de>
MAINTAINER Thomas Riechert <thomas.riechert@htwk-leipzig.de>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# install dependencies
RUN apt-get install -y libldap-2.4-2 libssl1.0.0 unixodbc wget make git nginx-light \
    php5 php5-fpm php5-common php5-cli \
    php5-odbc php5-curl


RUN rm -rf /var/www/*

# clone and update vocto
RUN git clone https://github.com/simeonackermann/VocTo.git /var/www/
RUN cd /var/www/ && git pull

# configure vocto for nginx (add php-fpm)
ADD vocto-nginx.conf /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/vocto-nginx.conf /etc/nginx/sites-enabled/

# expose the HTTP port to the outer world
EXPOSE 80

VOLUME /config
VOLUME /var/www/data

COPY run.sh /bin/

CMD ["run.sh"]


