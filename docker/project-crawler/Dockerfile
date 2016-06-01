FROM ubuntu:14.04

MAINTAINER Tobias Hahn <hahn-tobias@live.de>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# install dependencies
RUN apt-get install -y nodejs npm git wget
RUN sudo ln -s /usr/bin/nodejs usr/bin/node

RUN rm -rf /var/www/*


# clone and update project-crawler
RUN mkdir /opt/project-crawler 
RUN git clone https://github.com/heloisenetwork/project-crawler.git /opt/project-crawler

WORKDIR /opt/project-crawler

RUN git checkout -b develop origin/develop
RUN git pull origin develop
RUN npm install -g grunt-cli
RUN rm -rf node_modules/
RUN npm install

# expose the HTTP port to the outer world
# EXPOSE 80

#VOLUME /config
#VOLUME /var/www/data

CMD grunt ts:app run:server
