# nginx-example
This is a docker image based on the official NGINX docker image serving an example static web site built with the [Hugo](https://gohugo.io) static site generatori engine and using the [Meghna](https://themes.gohugo.io/meghna-hugo/) theme.

## How to run it
You can start this container with this docher command line:
```
docker run --name mysite -d -p 80:80 nginx-tomminux-example
```