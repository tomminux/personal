# Dockerfile to build an Ubuntu Docker Container runnin InfluxData InfluxDB TIme Series DB

FROM ubuntu
MAINTAINER Paolo Arcagni - paolo.arcagni@gmail.com

SHELL ["/bin/bash", "-c"]

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim curl apt-transport-https

RUN curl -sL https://repos.influxdata.com/influxdb.key | apt-key add -
RUN source /etc/lsb-release; echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | tee /etc/apt/sources.list.d/influxdb.list

RUN apt update
RUN apt install -y influxdb

COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 8083 8086

CMD /usr/local/bin/startContainer.sh
