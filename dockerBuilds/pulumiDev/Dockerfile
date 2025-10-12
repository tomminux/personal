## ----------------------------------------------------------------------------
##      ubuntuDev
## ----------------------------------------------------------------------------
##
##  Author:         Paolo Arcagni - paolo dot arcagni at gmail dot com
##
##  Description:    With this dockerfile you can build a docker container with 
##                  all tools needed to run a small ubuntu distribution to 
##                  develop with Pulumi. 
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

#RUN apt-get install -y curl wget iputils-ping traceroute net-tools vim ssh sudo git build-essential locales man unzip ca-certificates curl apt-transport-https lsb-release gnupg nginx tcpdump
RUN apt-get install -y curl wget iputils-ping vim ssh sudo git build-essential locales unzip ca-certificates apt-transport-https  

## ..:: Installing Python3 ::..
## ----------------------------------------------------------------------------

RUN apt-get install -y python3.8 python3.8-venv python3-pip
#RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN rm /usr/bin/python3
RUN ln -s /usr/bin/python3.8 /usr/bin/python3

## ..:: Installing Azure AZ command line ::..
## ----------------------------------------------------------------------------

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

## ..:: Installing Amazon AWS command line ::..
## ----------------------------------------------------------------------------

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

## ..:: Installing Google Cloud command line ::..
## ----------------------------------------------------------------------------

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y
RUN apt-get install -y google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-python-extras

## ..:: Installing Kubernetes kubectl command ::..
## ----------------------------------------------------------------------------

RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl

## ..:: User "ubuntu" initialization ::..
## ----------------------------------------------------------------------------

RUN useradd -c "Ubuntu Dev User" -d /home/ubuntu -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd ubuntu' 
RUN runuser -l ubuntu -c 'echo "PS1=\"[dockerC] - ${debian_chroot:+($debian_chroot)}\u@pulumiDev:\w\$ \"" >> .profile'
RUN runuser -l ubuntu -c 'mkdir .ssh'
RUN runuser -l ubuntu -c 'chmod 700 .ssh'
RUN runuser -l ubuntu -c 'echo "PUT YOUR id_rsa.pub CONTENT HERE" >> .ssh/authorized_keys'

## ..:: Installing Pulumi for user "ubuntu" ::..
## ----------------------------------------------------------------------------

RUN runuser -l ubuntu -c 'curl -fsSL https://get.pulumi.com | sh'

## ..:: Creating environment for dev ::..
## ----------------------------------------------------------------------------
## NOTE: we create a ~/dev directory for you to mount the docker host 
##       directory for persistence storage 

RUN runuser -l ubuntu -c 'mkdir dev'

## ..:: Container Startup Stuff ::..
## ----------------------------------------------------------------------------

COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 22
CMD /usr/local/bin/startContainer.sh
