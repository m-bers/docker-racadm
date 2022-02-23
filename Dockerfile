# wget-1.19.5 perl-4:5.26.3-416.el8 openssl-devel-1:1.1.1g-11.el8

FROM rockylinux:8

RUN yum install -y wget

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

RUN yum install -y srvadmin-idracadm7 perl openssl openssl-devel pciutils

RUN wget -O /tmp/pkg.tgz http://downloads.dell.com/FOLDER03240512M/1/OM-MgmtStat-Dell-Web-LX-8.2.0-1739_A00.tar.gz \
 && tar -C /tmp -xvf /tmp/pkg.tgz \
 && cd /tmp/linux/rac/RHEL7/x86_64 \
 && rpm -ivh *.rpm \
 && ln -sf /usr/lib64/libssl.so.1.0.1e /opt/dell/srvadmin/lib64/openmanage/private/libssl.so.0.9.8 \
 && rm -rf /tmp/* \
 && yum -y clean all


ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]
