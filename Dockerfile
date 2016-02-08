FROM ubuntu:14.04.3

ENV PACKER_VERSION 0.8.6
ENV TERRAFORM_VERSION 0.6.8
RUN apt-get install -y software-properties-common &&\ 
      apt-add-repository ppa:fkrull/deadsnakes &&\
      apt-get update &&\
      apt-get install -y curl wget unzip ansible &&\
      curl -kL https://bootstrap.pypa.io/get-pip.py | python &&\
      wget -nv -O packer.zip https://dl.bintray.com/mitchellh/packer/packer_${PACKER_VERSION}_linux_amd64.zip &&\
      unzip -d /usr/local/bin packer.zip && rm packer.zip &&\
      wget -nv -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&\
      unzip -d /usr/local/bin terraform.zip && rm terraform.zip &&\
      wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb &&\
      sudo dpkg -i vagrant_1.8.1_x86_64.deb && rm vagrant_1.8.1_x86_64.deb &&\
      pip install awscli &&\
      vagrant plugin install vagrant-aws
