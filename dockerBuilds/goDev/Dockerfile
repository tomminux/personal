## ----------------------------------------------------------------------------
##      Go Development Environment
## ----------------------------------------------------------------------------
##
##  Author:         Paolo Arcagni - paolo dot arcagni at gmail dot com
##
##  Description:    With this dockerfile you can build a docker container  
##                  running Ubuntu ready to be use as a development 
##                  environment for the GOLANG programming language
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

## ..:: Downlading and installing GO Lang ::.
## ----------------------------------------------------------------------------

RUN apt-get install -y curl ssh vim
RUN curl -O https://dl.google.com/go/go1.15.6.linux-amd64.tar.gz
RUN tar zxvf go1.15.6.linux-amd64.tar.gz
RUN chown -R root:root go
RUN mv go /usr/local/.

## ..:: User "ubuntu" initialization ::..
## ----------------------------------------------------------------------------

RUN useradd -c "Ubuntu Dev User" -d /home/ubuntu -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd ubuntu' 
RUN runuser -l ubuntu -c 'echo "PS1=\"[dockerC] - ${debian_chroot:+($debian_chroot)}\u@goDev:\w\$ \"" >> .profile'
RUN runuser -l ubuntu -c 'mkdir .ssh'
RUN runuser -l ubuntu -c 'chmod 700 .ssh'
RUN runuser -l ubuntu -c 'echo "PUT YOUR id_rsa.pub CONTENT HERE" >> .ssh/authorized_keys'

## ..:: Setting GO Env for User "ubuntu" ::..
## ----------------------------------------------------------------------------

RUN runuser -l ubuntu -c 'mkdir -p dev/go/work'
RUN runuser -l ubuntu -c 'echo "export GOPATH=$HOME/dev/go/work" >> .profile'
RUN runuser -l ubuntu -c 'echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> .profile'

## ..:: Container Startup Stuff ::..
## ----------------------------------------------------------------------------

COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 22
CMD /usr/local/bin/startContainer.sh