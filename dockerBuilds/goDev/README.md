# GO Lang Docker Container
## Introduction

With this dockerfile you can build a docker container with all tools needed to write code in GO Lang. 

Your work directory will be created in:

    /home/ubuntu/dev/go/work

The "docker run" command below will assume you have a "dev" directory on your
host and will link this direcotry on "/home/ubuntu/dev" in your docker container:

    /<your-dev-dir> -> /home/ubuntu/dev

## Usage
Create an empty directory and copy there
* Dockerfile
* startContainer.sh

From that directory run the following command:

    docker build . -t "golang-dev:latest"
    
Once you have the golang-dev in you images, run it with: 

    docker run --name goDev -d -p 2222:22 -v /<your-dev-dir>:/home/ubuntu/dev golang-dev:latest
    
You can get to your terraform development docker with

    ssh -l ubuntu -p 2222 127.0.0.1
    
or, if you prefer, you can get to the bash shell directly with the docker exec command:

    docker exec -ti goDev /bin/bash