FROM centos:7

ADD emqx-ee-centos7-v3.4.5.x86_64.rpm /
RUN rpm -i /emqx-ee-centos7-v3.4.5.x86_64.rpm

ADD emqx.lic /etc/emqx/

