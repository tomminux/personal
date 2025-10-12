# Pulumi / Azure / AWS / GCP / Kubectl Docker Container
## Introduction

With this dockerfile you can build a docker container with all tools needed to run Pulimi infrastructure as code sciprts. 

Azure "az" Command Line Tools was added to work on Microsoft Azure public cloud
Google "gcloud" Command Line Tools was added to work with Google Cloud Platform 
AWS "aws" Command Line Tools was added to work with Amazon AWS Cloud

## Usage
Create an empty directory and copy there
* Dockerfile
* startContainer.sh

From that directory run the following command:

    docker build . -t "pulumi-dev:latest"
    
Once you have the pulumi-dev in you images, run it with: 

    docker run --name pulumiDev -d -p 2222:22 -v /<your-dev-dir>:/home/ubuntu/dev pulumi-dev:latest
    
You can get to your terraform development docker with

    ssh -l ubuntu -p 2222 127.0.0.1
    
or, if you prefer, you can get to the bash shell directly with the docker exec command:

    docker exec -ti pulumiDev /bin/bash