## ----------------------------------------------------------------------------
##      Claude Code Dev Environment in a Docker
## ----------------------------------------------------------------------------
##
##  Author:         Paolo Arcagni - paolo dot arcagni at gmail dot com
##
##  Description:    
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

RUN apt-get install -y curl wget iputils-ping traceroute net-tools vim ssh sudo git build-essential locales man unzip ca-certificates curl apt-transport-https lsb-release gnupg jq nodejs

## ..:: User "ubuntu" initialization ::..
## ----------------------------------------------------------------------------

#RUN useradd -c "Ubuntu Dev User" -d /home/ubuntu -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd ubuntu' 
RUN runuser -l ubuntu -c 'echo "PS1=\"[podmanC-ollamaLLM] - ${debian_chroot:+($debian_chroot)}\u@claudeCode:\w\$ \"" >> .profile'
RUN runuser -l ubuntu -c 'mkdir .ssh'
RUN runuser -l ubuntu -c 'chmod 700 .ssh'
#RUN runuser -l ubuntu -c 'echo "PUT YOUR id_rsa.pub CONTENT HERE" >> .ssh/authorized_keys'
RUN runuser -l ubuntu -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCWVsDpYMhYPbg7NdDai/vxpw1TXuWL/RV0HENUc3/ULwc+H0jLWwQ72c723dkggBSZBI2sLGXSgG8dPa+6M2Bem57lSE6tYIm0kTETv0M+k9D5Bv/z3JNSXPhiEuH24FS4puD3r90BJA12hK9XOihZN3cn3TeLSMBEDX6MsP+igg5B7n6mhEjJfXRKds3kRcP26p97yh92BEgvE4K+EMOiwT0HF6gJDtLOO/59VMj1QYRVLZarmQXk4z5NbHOKK+ZuMkaXGlogChA6noDyqIg4gQ4YNwgnj0EW9tOrea53u68VDnwtUqOzlOs2boysgnI+opGnSK+RkfEgj1NyqrGHU0/XGHCKPuPxKjA2dR2m4DBXlU6uk5JOtRbh/2EtPnc2X7AhKIlAzL0/oj4yGgwNZEz3n72iP2RT2/jzcejnINprotBxqFauBT2jlwt1Pifzq0B3l8QokLZan3TGIA1+AERuyUFs2eubESlMSRxu55Nwt4V8CdDV/s0V+dm3z/Xb9VnGdk3rWTUPBANmmZOcaW7kVjHM5hKWr3d+OrIFh49zJ02+ZrBiP6SkXaDqc6KyXOGEj14EpCBYJ7GsW8KfdyDP4pzGgAMMtj+MlWSNVnJD1OI+hzrlKWewgK9Xc+oBmtx746vNkMrkHV4hj7OaSrgManLUDNiIZKXtzdwzJw== arcagni@ITA-ML-00022138" >> .ssh/authorized_keys'
RUN runuser -l ubuntu -c 'echo "" >> .ssh/authorized_keys'
RUN runuser -l ubuntu -c 'mkdir workspace'

## ..:: Claude Code installation
## ----------------------------------------------------------------------------

ENV NODE_ENV=production

RUN apt update && apt install -y npm
RUN npm install -g @anthropic-ai/claude-code

COPY startContainer.sh /usr/local/bin/.
COPY localStartClaude.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh
RUN chmod 755 /usr/local/bin/localStartClaude.sh

EXPOSE 22
CMD /usr/local/bin/startContainer.sh
