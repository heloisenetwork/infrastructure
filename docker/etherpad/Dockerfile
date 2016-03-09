# Etherpad-Lite Dockerfile
#
# https://github.com/ether/etherpad-docker
#
# Developed from a version by Evan Hazlett at https://github.com/arcus-io/docker-etherpad 
# Developed from a version by Mathieu Thoretton at https://github.com/mthoretton/etherpad-docker

# Version 1.0

FROM node:latest
MAINTAINER Thomas Riechert <thomas.riechert@htwk-leipzig.de>

# Get Etherpad-lite's other dependencies
RUN apt-get update

RUN apt-get install -y gzip git-core curl python libssl-dev pkg-config build-essential supervisor

# Grab the latest Git version
RUN cd /opt && git clone https://github.com/ether/etherpad-lite.git etherpad

# Install node dependencies
RUN /opt/etherpad/bin/installDeps.sh

# Add conf files
ADD settings.json /opt/etherpad/settings.json
ADD supervisor.conf /etc/supervisor/supervisor.conf

EXPOSE 9001
CMD ["supervisord", "-c", "/etc/supervisor/supervisor.conf", "-n"]
