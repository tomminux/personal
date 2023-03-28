## ----------------------------------------------------------------------------
##      paoloDev
## ----------------------------------------------------------------------------
##
##  Author:      Paolo Arcagni - paolo dot arcagni at gmail dot com
##
##  Date:        March 2023
##  Description: A docker container to offer a hugo dev environment   
##
## ----------------------------------------------------------------------------

## ..:: I am running eveything in an Ubuntu Environment ::..
## ----------------------------------------------------------------------------

FROM ubuntu
LABEL maintainer="Paolo Arcagni - paolo.arcagni@gmail.com" 

## ..:: Ubuntu OS update to latest ::..
## ----------------------------------------------------------------------------

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get upgrade -y

## ..:: Installing Software we need to run terraform ::..
## ----------------------------------------------------------------------------

RUN apt-get install -y curl wget iputils-ping traceroute net-tools vim ssh sudo git build-essential locales man unzip ca-certificates curl apt-transport-https lsb-release gnupg

## ..:: User "ubuntu" initialization ::..
## ----------------------------------------------------------------------------

RUN useradd -c "Ubuntu Dev User" -d /home/ubuntu -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd ubuntu' 
RUN runuser -l ubuntu -c 'echo "PS1=\"[dockerC] - ${debian_chroot:+($debian_chroot)}\u@hugoDev:\w\$ \"" >> .profile'
RUN runuser -l ubuntu -c 'mkdir .ssh'
RUN runuser -l ubuntu -c 'chmod 700 .ssh'
#RUN runuser -l ubuntu -c 'echo "PUT YOUR id_rsa.pub CONTENT HERE" >> .ssh/authorized_keys'
RUN runuser -l ubuntu -c 'echo "" >> .ssh/authorized_keys'

## ..:: Creating environment for dev ::..
## ----------------------------------------------------------------------------
## NOTE: we create a ~/dev directory for you to mount the docker host 
##       directory for persistence storage 

RUN runuser -l ubuntu -c 'mkdir dev'

## ..:: Installing GO adn Hugo ::..
## ----------------------------------------------------------------------------

RUN curl -OL https://golang.org/dl/go1.20.2.linux-arm64.tar.gz
RUN curl -OL https://github.com/gohugoio/hugo/releases/download/v0.111.3/hugo_0.111.3_linux-amd64.tar.gz
RUN tar -C /usr/local -xvf go1.20.2.linux-arm64.tar.gz
RUN echo "export PATH=$PATH:/usr/local/go/bin" >> /root/.profile
RUN echo "export PATH=$PATH:/usr/local/go/bin" >> /home/ubuntu/.profile
RUN mkdir /usr/local/hugo
RUN tar -C /usr/local/hugo -xvf hugo_0.111.3_linux-amd64.tar.gz
RUN cp /usr/local/hugo/hugo /usr/local/bin

## ..:: Installing Microsoft Azure "az" CLI ::..
## ----------------------------------------------------------------------------

RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN export AZ_REPO=`lsb_release -cs` && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN apt update -y
RUN apt install azure-cli -y

## ..:: Container Startup Stuff ::..
## ----------------------------------------------------------------------------

COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 22
CMD /usr/local/bin/startContainer.sh