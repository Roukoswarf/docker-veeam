FROM centos:centos7
MAINTAINER Alexander Diana <alex@holsag.com>

RUN yum -y update; yum clean all
RUN yum -y groupinstall core
RUN yum -y install openssh-server passwd perl perl-Data-Dumper net-tools; yum clean all
ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN chmod 755 /start.sh
# EXPOSE 22
RUN ./start.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
