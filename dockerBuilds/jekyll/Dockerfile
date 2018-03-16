# Dockerfile to build a Docker Container running on Ubuntu 16.04

FROM ubuntu
MAINTAINER Paolo Arcagni - paolo.arcagni@gmail.com

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim curl ruby ruby-dev build-essential apache2
RUN gem install jekyll bundler

COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

CMD /usr/local/bin/startContainer.sh
