FROM centos:7

ADD emqx-ee-centos7-v3.4.5.x86_64.rpm /
#RUN useradd -u 1000170000 -d /var/lib/emqx -s /bin/bash emqx
RUN rpm -i /emqx-ee-centos7-v3.4.5.x86_64.rpm

ADD emqx.lic /etc/emqx/
ADD emqx.conf /etc/emqx/emqx.conf
ADD start.sh /

USER emqx

CMD ["/start.sh"]
