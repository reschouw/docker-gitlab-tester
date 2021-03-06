FROM ubuntu:latest

RUN echo "hello world"

# Install Curl
RUN apt-get update
RUN apt-get install -y curl gnupg software-properties-common

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt-get update
RUN apt-get -y install docker-ce

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin
