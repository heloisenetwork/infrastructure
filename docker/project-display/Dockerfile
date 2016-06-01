FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y git apache2 wget

#setting up apache2 webserver
COPY 000-display.conf /etc/apache2/sites-available/000-display.conf
RUN ln -s /etc/apache2/sites-available/000-display.conf /etc/apache2/sites-enabled/000-display.conf

RUN rm /etc/apache2/sites-enabled/000-default.conf

RUN rm -rf var/www/html/

RUN git clone https://github.com/heloisenetwork/project-display.git /var/www

WORKDIR /var/www/
RUN git fetch origin
RUN git pull origin master
RUN ls  -al 

CMD service apache2 start && touch test.txt && tail -f test.txt

