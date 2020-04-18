FROM python:3.7.7-slim-stretch

RUN apt-get update \
    && mkdir -p /usr/share/man/man1 \
    && mkdir -p /usr/share/man/man7 \
    && apt-get install --no-install-recommends -y \
    iputils-ping \
    iproute2 \
    wget \
    gcc \
    g++ \
    libc6-dev \
    make \
    gnupg2 \
    unzip \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN pip3 install --upgrade pip
RUN pip3 install awscli boto3

#Install Terraform Version 0.12.24
RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip \
  && unzip terraform_0.12.24_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.24_linux_amd64.zip
