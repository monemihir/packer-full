FROM hashicorp/packer:latest
LABEL maintainer="Mihir Mone <monemihir@hotmail.com>"

RUN apk --no-cache add ansible py-pip py-boto
COPY ansible.cfg /etc/ansible
RUN pip install pywinrm

RUN ansible --version

RUN apk --no-cache add docker openrc
RUN rc-update add docker boot

# Packer needs this set:
# https://github.com/mitchellh/packer/blob/49067e732a66c9f7a87843a2c91100de112b21cc/provisioner/ansible/provisioner.go#L127
ENV USER root
