# Dockerfile to build Paolo's Development Environmnet

FROM ubuntu
LABEL maintainer="Paolo Arcagni - paolo.arcagni@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# Ubuntu OS update to latest
RUN apt-get update
RUN apt-get upgrade -y

# Installing Software
RUN apt-get install -y software-properties-common curl wget vim ssh sudo git build-essential ansible

RUN mkdir /root/.ssh
RUN chmod 700 /root/.ssh
COPY id_rsa /root/.ssh/.
COPY id_rsa.pub /root/.ssh/.

# User "ansible" initialization
RUN useradd -c "Ansible User" -d /home/ansible -m -s /bin/bash ansible
RUN usermod -aG sudo ansible
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd ansible'
RUN runuser -l ansible -c 'echo "alias vim=nvim" >> .profile'
RUN runuser -l ansible -c 'echo "PS1=\"[dockerC] --> ${debian_chroot:+($debian_chroot)}\u@ansibleDev:\w\$ \"" >> .profile'
RUN runuser -l ansible -c 'mkdir .ssh'
RUN runuser -l ansible -c 'chmod 700 .ssh'
RUN runuser -l ansible -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBvCAGWEOMBVKfHrad1aJd5a0YmFGVlV2yPXJuptN2FQckntie8o8UXqXWX1NrL1Yog2P8tnUVZMAMAc/bLcJteU/PEvLc081JKT46+ylvgT+8gibssuMSW48yZXgBuTH7l4im1kpySARNLr2uy0IChMVUncU0W8mxtdvt5xw0PYM9FofhWJqMDQCnOD+yQ2mpRGYwD+o55onXBKm3qGtXYiR8LGagfCXAKZU9hQfC6YWjjpE60M0ibTl9v6XmAhPFZjdG1CNT2jZJnLwIiv1PJtpWXAzBn5Hd43PQ2LyBFK1u7UrbOgYj3S8HLFNUtEm24KG83JkqiMdgu/ld1yBv root@ip-10-1-1-4" >> .ssh/authorized_keys'

# Creating environment for dev
RUN runuser -l ansible -c 'mkdir ansible'

# Container Startup Stuff
COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 22

CMD /usr/local/bin/startContainer.sh