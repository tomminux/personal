## ----------------------------------------------------------------------------
##      ubuntuDev
## ----------------------------------------------------------------------------
##
##  Author:         Paolo Arcagni - paolo dot arcagni at gmail dot com
##
##  Description:    With this dockerfile you can build a docker container with 
##                  all tools needed to run a small ubuntu distribution to 
##                  debug PODs inside a k8 cluster. 
##
## ----------------------------------------------------------------------------

## ..:: I am running eveything in an Ubuntu Environment ::..
## ----------------------------------------------------------------------------

FROM ubuntu
LABEL maintainer="Paolo Arcagni - paolo.arcagni@gmail.com" 

## ..:: Ubuntu OS update to latest ::..
## ----------------------------------------------------------------------------

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y software-properties-common
RUN apt-get update

## ..:: Installing Software we need to debug stuff ::..
## ----------------------------------------------------------------------------

RUN apt-get install -y curl wget iputils-ping traceroute net-tools vim ssh sudo git build-essential locales man unzip ca-certificates curl apt-transport-https lsb-release gnupg nginx tcpdump

## ..:: User "ubuntu" initialization ::..
## ----------------------------------------------------------------------------

RUN useradd -c "Ubuntu Dev User" -d /home/ubuntu -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd ubuntu' 
RUN runuser -l ubuntu -c 'echo "PS1=\"[dockerC] - ${debian_chroot:+($debian_chroot)}\u@ubuntuDev:\w\$ \"" >> .profile'
RUN runuser -l ubuntu -c 'mkdir .ssh'
RUN runuser -l ubuntu -c 'chmod 700 .ssh'
RUN runuser -l ubuntu -c 'echo "PUT YOUR id_rsa.pub CONTENT HERE" >> .ssh/authorized_keys'

## ..:: Creating environment for dev ::..
## ----------------------------------------------------------------------------
## NOTE: we create a ~/dev directory for you to mount the docker host 
##       directory for persistence storage 

RUN runuser -l ubuntu -c 'mkdir nfs-storage'

## ..:: Container Startup Stuff ::..
## ----------------------------------------------------------------------------

COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 22
CMD /usr/local/bin/startContainer.sh