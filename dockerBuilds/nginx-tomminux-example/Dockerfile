# Dockerfile to build Paolo's Hugo SSG Development Environmnet

FROM nginx
MAINTAINER Paolo Arcagni - paolo.arcagni@gmail.com

# Copying meghna Hugo files to the container
RUN rm /usr/share/nginx/html/*
ADD public /usr/share/nginx/html/
EXPOSE 80 443

