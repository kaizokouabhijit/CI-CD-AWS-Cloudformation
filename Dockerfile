# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set environment variable to avoid interactive prompts during apt-get installs
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
        python3 \
        python3-pip \
        dos2unix \
        && rm -rf /var/lib/apt/lists/*

# Install AWS CLI
RUN apt-get update && \
    apt-get install -y awscli < "/dev/null"

# Install OpenJDK 8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk

# Set Java Home environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Install dos2unix
RUN apt-get install -y dos2unix

# Install Docker using the official installation script
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    rm get-docker.sh

# Set up Docker Compose
RUN pip3 install docker-compose

# Set the working directory
WORKDIR /code

# Display a message indicating the completion of the Docker image build
RUN echo "Building Docker image completed"

# Other Dockerfile commands...
