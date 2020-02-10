# Dockerfile to build Paolo's Development Environmnet

FROM ubuntu
MAINTAINER Paolo Arcagni - paolo.arcagni@gmail.com

# Ubuntu OS update to latest
RUN apt-get update
RUN apt-get upgrade -y

# Add "neovim" through ppa 
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:neovim-ppa/stable
RUN apt-get update

# Installing Software
RUN apt-get install -y neovim curl wget iputils-ping inetutils-telnet traceroute net-tools tcpdump vim netcat ssh sudo git build-essential locales man

# User "paolo" initialization
RUN useradd -c "Paolo Arcagni" -d /home/paolo -m -s /bin/bash paolo
RUN usermod -aG sudo paolo
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd paolo' 
RUN runuser -l paolo -c 'echo "alias vim=nvim" >> .profile'
RUN runuser -l paolo -c 'echo "PS1=\"[dockerC] --> ${debian_chroot:+($debian_chroot)}\u@paoloDev:\w\$ \"" >> .profile'
RUN runuser -l paolo -c 'mkdir .ssh'
RUN runuser -l paolo -c 'chmod 700 .ssh'
RUN runuser -l paolo -c 'echo "YOUR id_rsa.pub CONTENT HERE" >> .ssh/authorized_keys'

# Creating environment for dev
RUN runuser -l paolo -c 'mkdir dev'

# Container Startup Stuff
COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 22

CMD /usr/local/bin/startContainer.sh
