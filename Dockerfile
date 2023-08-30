
# THE CONTAINER IN THIS DOCKER IMAGE CAN BE USED TO RUN A CLOUDFORMATION DEPLOYMENT TASK USING SHELL SCRIPT AND DOCKER
# THE CONTAINER WILL HAVE THE ABILITY TO CREATE DOCKER IMAGES INSIDE IT
# Base image
FROM ubuntu:latest

# Install Docker and other required packages

RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce

ADD path to folder\* \code



WORKDIR /code


# Run below commands inside the container cli


# RUN apt-get update && apt-get install -y awscli
# RUN chmod 777 ot_deploy_forecaster.sh
# RUN apt-get install dos2unix
# RUN dos2unix ./ot_deploy_forecaster.sh

# to mount folders in the container image, use the command below to run the container
# docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v /path/on/your/host:/path/in/container python3-10



