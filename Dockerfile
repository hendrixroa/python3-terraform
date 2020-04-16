FROM docker:latest

RUN apk update
RUN apk upgrade
RUN apk add --update zip unzip wget
RUN apk add --no-cache python3 py-pip git
RUN apk add --no-cache build-base g++
RUN pip install --upgrade pip
RUN pip install --upgrade awscli

#Install Terraform Version 0.12.24
RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip \
  && unzip terraform_0.12.24_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.24_linux_amd64.zip
