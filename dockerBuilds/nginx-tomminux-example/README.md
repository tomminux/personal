# nginx-example
This is a docker image based on the official NGINX docker image serving an example static web site built with the [Hugo](https://gohugo.io) static site generatori engine and using the [Meghna](https://themes.gohugo.io/meghna-hugo/) theme.

## How to run it
You can start this container with this docher command line:
```
docker run --name mysite -d -p 80:80 nginx-tomminux-example
```

## Note
Please be aware that this Go Theme was configured to serve the static site from 
    https://www.example.com
Due to this configuration (you can change it in the config.tmol file, running the hugo command on your host to regenerate the static content of the websiate), you need to expose this through an SSL Offload system like an Application Delivery Controller or an NGINX KIC in k8s environment.