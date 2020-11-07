FROM centos:centos8

RUN yum install -y wget-1 perl-4 openssl-devel-1 && \
    yum clean all

# DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

RUN yum install -y srvadmin-idracadm8 && \
    yum clean all

ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm8"]
