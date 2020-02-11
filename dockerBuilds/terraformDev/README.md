# Terraform Docker Container
## Introduction

With this dockerfile you can build a docker container with all tools needed to run Terraform sciprts. 

Azure "az" Command Line Tools was added to work on Microsoft Azure public cloud

## Usage
Create an empty directory and copy there
* Dockerfile
* startContainer.sh

From that directory run the following command:

    docker build . -t "terraform-dev:latest"
    
Once you have the terraform-dev in you images, run it with: 

    docekr run --name terraformDev -f -p 2222:22 -v /<your-dev-dir>:/home/ubuntu/dev terraform-dev:latest
    
You can get to your terraform development docker with

    ssh -l ubuntu -p 2222 127.0.0.1