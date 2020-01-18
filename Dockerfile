FROM centos:7

ADD emqx-ee-centos7-v3.4.5.x86_64.rpm /

RUN rpm -i /emqx-ee-centos7-v3.4.5.x86_64.rpm
RUN yum install -y curl

ADD emqx.lic /etc/emqx/
ADD emqx.conf /etc/emqx/emqx.conf
RUN chmod a+w /etc/emqx/emqx.conf
ADD start.sh /

USER emqx

CMD ["/start.sh"]
