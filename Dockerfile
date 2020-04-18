FROM docker:latest

RUN apk update && apk upgrade && \
    apk --no-cache --virtual build-dependencies add \
    zip \
    unzip \
    wget \
    python3 \ 
    py-pip \
    git \
    build-base \
    g++ && \
    rm -rf /var/cache/apk/*

RUN pip install --upgrade pip boto3 awscli

#Install Terraform Version 0.12.24
RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip \
  && unzip terraform_0.12.24_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.24_linux_amd64.zip
