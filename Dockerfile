FROM centos:centos8

RUN yum install -y wget perl openssl-devel && \
    yum clean all

RUN wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

RUN yum install -y srvadmin-idracadm8

ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm8"]
