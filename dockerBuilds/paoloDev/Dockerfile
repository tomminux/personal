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
RUN apt-get install -y neovim curl wget iputils-ping inetutils-telnet traceroute net-tools tcpdump vim netcat ssh sudo git 
RUN apt-get install -y man

# User "paolo" initialization
RUN useradd -c "Paolo Arcagni" -d /home/paolo -m -s /bin/bash paolo
RUN usermod -aG sudo paolo
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd paolo' 
RUN runuser -l paolo -c 'echo "alias vim=nvim" >> .profile'
RUN runuser -l paolo -c 'echo "PS1=\"[dockerC] --> ${debian_chroot:+($debian_chroot)}\u@paoloDev:\w\$ \"" >> .profile'
RUN runuser -l paolo -c 'mkdir .ssh'
RUN runuser -l paolo -c 'chmod 700 .ssh'
RUN runuser -l paolo -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC5a5Sdigk4QkPb9DU3viWOUrXQTqc4Ks8ZEy3eMGh6q0JvvOYpW7JVfN4ZMDeU+TlXDj8uqggO2XCd8h3LWaoduTnBdOJeI9qAtjsudWsRPssyskyfDMd6E00JVpPUQmwoLyOqUbqwPp4c860Y06biVCqzq/y0cZ6JVQXPUiuKAbWXSg1kLRO5PeQ7bYu4iSlNRkjPRSzY9UIKjX7kC/xSFqKiSbsYwS7Pszq1ukcnXUNrijbf6qBlVgtCzXIMKZK2DHEfCFfvFxfupI0mWIFtP1I51NIKJEYlY5ToAHiXFSK//RjIhlWKRqAu5ceNgD9dn0j/48saIaxwToA7jky8nVtVoWy6xKroU2GrgyZvNmRgn+24YIROkfiIdbgG8rHqxWx9ccH3e+7/xuPLkbFYxEiTO/T4ZKjHGqt68JAuaV7B7V7ZJpwo+ItdqaekgjIM5lMbjlLzz1a9hwf4c1tPOOlXvCgfL9AlV7wCTXnPSltQiFYtwTHc3DKgEasG0hXgNCQxbIwGuwcEbF6IAJ4wuPU/alYoMMIv+OH2ghwi1nY+bQWCs4v69+PmfhftfS93yv1OJdPvaGc/m4Vgw8a7DpGBK+JmVnZyQN/s/65LCU6DBNCHjP+IcHT8UvdHf4WKK8AOg+Muq/jF8maoXxczrm5GAz7kZ5vp4R0l8HQO2w== arcagni@ITA-ML-00030277" >> .ssh/authorized_keys'

# Creating environment for dev
RUN runuser -l paolo -c 'mkdir dev'

# Container Startup Stuff
COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 22

CMD /usr/local/bin/startContainer.sh
