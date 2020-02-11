# Dockerfile to build Paolo's Terraform Development Environmnet
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
RUN apt-get install -y neovim curl wget iputils-ping traceroute net-tools vim ssh sudo git build-e
ssential locales man unzip
# User "ubuntu" initialization
RUN useradd -c "Paolo Arcagni" -d /home/ubuntu -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu
RUN /bin/bash -c 'echo -e "default\ndefault" | passwd ubuntu' 
RUN runuser -l ubuntu -c 'echo "alias vim=nvim" >> .profile'
RUN runuser -l ubuntu -c 'echo "PS1=\"[dockerC] --> ${debian_chroot:+($debian_chroot)}\u@terraform
Dev:\w\$ \"" >> .profile'
RUN runuser -l ubuntu -c 'mkdir .ssh'
RUN runuser -l ubuntu -c 'chmod 700 .ssh'
RUN runuser -l ubuntu -c 'echo "PUT YOUR id_rsa.pub CONTENT HERE" >> .ssh/authorized_keys'
# Creating environment for dev
RUN runuser -l ubuntu -c 'mkdir dev'
# Terraform installation
RUN curl -LO https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
RUN unzip terraform_0.12.20_linux_amd64.zip
RUN mv ./terraform /usr/local/bin/.
# Installing Microsoft Azure "az" CLI
RUN apt install ca-certificates curl apt-transport-https lsb-release gnupg -y
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trus
ted.gpg.d/microsoft.asc.gpg > /dev/null
ENV AZ_REPO $(lsb_release -cs)
RUN export AZ_REPO=`lsb_release -cs` && echo "deb [arch=amd64] https://packages.microsoft.com/repo
s/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN apt update -y
RUN apt install azure-cli -y
# Container Startup Stuff
COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh
EXPOSE 22
CMD /usr/local/bin/startContainer.sh