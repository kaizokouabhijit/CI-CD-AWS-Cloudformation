
# THE CONTAINER IN THIS DOCKER IMAGE CAN BE USED TO RUN A CLOUDFORMATION DEPLOYMENT TASK USING SHELL SCRIPT AND DOCKER
# THE CONTAINER WILL HAVE THE ABILITY TO CREATE DOCKER IMAGES INSIDE IT
# Base image
FROM ubuntu:latest

# Install Docker and other required packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce
RUN apt-get install -y python3 python3-pip
RUN pip3 install docker-compose

# ADD path to folder\* \code
RUN echo "building docker image"

WORKDIR /code


# Run below commands inside the container cli

# To install awscli
RUN apt-get update && apt-get install -y awscli < "/dev/null"
RUN apt-get update && apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# To change permission of file
# RUN chmod 777 filename

# dos2unis is good for working with .sh, .yaml type of files
RUN apt-get install dos2unix
# RUN dos2unix ./filename.sh

# to mount folders in the container image, use the command below to run the container
# docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v /path/on/your/host:/path/in/container imageName



