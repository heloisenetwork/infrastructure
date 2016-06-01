FROM ubuntu:14.04

MAINTAINER Tobias Hahn <hahn-tobias@live.de>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# install dependencies
RUN apt-get install -y nodejs npm git wget
RUN sudo ln -s /usr/bin/nodejs usr/bin/node

RUN rm -rf /var/www/*


# clone project-crawler
RUN mkdir /opt/project-crawler 
RUN git clone https://github.com/heloisenetwork/project-crawler.git /opt/project-crawler

WORKDIR /opt/project-crawler

# Checkout branch 
RUN git fetch origin
RUN git pull origin master

RUN npm install -g grunt-cli
RUN rm -rf node_modules/
RUN npm install

CMD grunt ts:app run:server
