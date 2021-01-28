# Dockerfile to build Paolo's Development Environmnet

FROM ubuntu
LABEL maintainer="Paolo Arcagni - paolo.arcagni@gmail.com" 

ENV DEBIAN_FRONTEND noninteractive

# Ubuntu OS update to latest
RUN apt-get update
RUN apt-get upgrade -y

# Installing Software
RUN apt-get install -y software-properties-common curl wget vim ssh sudo git build-essential ansible

# User "ansible" initialization
RUN useradd -c "Ansible User" -d /home/ansible -m -s /bin/bash ansible
RUN usermod -aG sudo ansible
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd ansible' 
RUN runuser -l ansible -c 'echo "alias vim=nvim" >> .profile'
RUN runuser -l ansible -c 'echo "PS1=\"[dockerC] --> ${debian_chroot:+($debian_chroot)}\u@ansibleDev:\w\$ \"" >> .profile'
RUN runuser -l ansible -c 'mkdir .ssh'
RUN runuser -l ansible -c 'chmod 700 .ssh'
RUN runuser -l ansible -c 'echo "YOUR id_rsa.pub CONTENT HERE" >> .ssh/authorized_keys'

# Creating environment for dev
RUN runuser -l ansible -c 'mkdir ansible'

# Container Startup Stuff
COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 22

CMD /usr/local/bin/startContainer.sh
