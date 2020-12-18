## ----------------------------------------------------------------------------
##      terraformDev
## ----------------------------------------------------------------------------
##
##  Author:         Paolo Arcagni - paolo dot arcagni at gmail dot com
##
##  Description:    With this dockerfile you can build a docker container with 
##                  all tools needed to run Terraform sciprts. 
##
##                  Azure "az" Command Line Tools was added to work on 
##                  Microsoft Azure public cloud
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

## ..:: Installing Software we possibly need ::.
## ----------------------------------------------------------------------------

RUN apt-get update
RUN apt-get install -y software-properties-common 
RUN apt-get update
RUN apt-get install -y curl wget vim ssh build-essential unzip ca-certificates apt-transport-https lsb-release sudo python

## ..:: User "ubuntu" initialization ::..
## ----------------------------------------------------------------------------

RUN useradd -c "Ubuntu Dev User" -d /home/ubuntu -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd ubuntu' 
RUN runuser -l ubuntu -c 'echo "PS1=\"[dockerC] - ${debian_chroot:+($debian_chroot)}\u@terraformDev:\w\$ \"" >> .profile'
RUN runuser -l ubuntu -c 'mkdir .ssh'
RUN runuser -l ubuntu -c 'chmod 700 .ssh'
#RUN runuser -l ubuntu -c 'echo "PUT YOUR id_rsa.pub CONTENT HERE" >> .ssh/authorized_keys'
RUN runuser -l ubuntu -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCWVsDpYMhYPbg7NdDai/vxpw1TXuWL/RV0HENUc3/ULwc+H0jLWwQ72c723dkggBSZBI2sLGXSgG8dPa+6M2Bem57lSE6tYIm0kTETv0M+k9D5Bv/z3JNSXPhiEuH24FS4puD3r90BJA12hK9XOihZN3cn3TeLSMBEDX6MsP+igg5B7n6mhEjJfXRKds3kRcP26p97yh92BEgvE4K+EMOiwT0HF6gJDtLOO/59VMj1QYRVLZarmQXk4z5NbHOKK+ZuMkaXGlogChA6noDyqIg4gQ4YNwgnj0EW9tOrea53u68VDnwtUqOzlOs2boysgnI+opGnSK+RkfEgj1NyqrGHU0/XGHCKPuPxKjA2dR2m4DBXlU6uk5JOtRbh/2EtPnc2X7AhKIlAzL0/oj4yGgwNZEz3n72iP2RT2/jzcejnINprotBxqFauBT2jlwt1Pifzq0B3l8QokLZan3TGIA1+AERuyUFs2eubESlMSRxu55Nwt4V8CdDV/s0V+dm3z/Xb9VnGdk3rWTUPBANmmZOcaW7kVjHM5hKWr3d+OrIFh49zJ02+ZrBiP6SkXaDqc6KyXOGEj14EpCBYJ7GsW8KfdyDP4pzGgAMMtj+MlWSNVnJD1OI+hzrlKWewgK9Xc+oBmtx746vNkMrkHV4hj7OaSrgManLUDNiIZKXtzdwzJw== arcagni@ITA-ML-00022138" >> .ssh/authorized_keys'

## ..:: Creating environment for dev ::..
## ----------------------------------------------------------------------------
## NOTE: we create a ~/Downloads directory for you to mount the docker host 
##       directory for persistence storage 

RUN runuser -l ubuntu -c 'mkdir Downloads'

## ..:: Youtube-DL installation ::..
## ----------------------------------------------------------------------------

RUN wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
RUN chmod a+x /usr/local/bin/youtube-dl
RUN hash -r

## ..:: Container Startup Stuff ::..
## ----------------------------------------------------------------------------

COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 22
CMD /usr/local/bin/startContainer.sh
