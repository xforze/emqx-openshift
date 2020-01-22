FROM centos:7

#ADD emqx-ee-centos7-v3.4.5.x86_64.rpm /
ADD emqx-ee-centos7-v4.0.0.x86_64.rpm /


#RUN rpm -i /emqx-ee-centos7-v3.4.5.x86_64.rpm
RUN rpm -i emqx-ee-centos7-v4.0.0.x86_64.rpm
RUN yum install -y curl tcpdump

ADD emqx.lic /etc/emqx/
ADD emqx.conf.v4 /etc/emqx/emqx.conf
ADD acl.conf /etc/emqx/
ADD emqx_auth_username.conf /etc/emqx/plugins/
#ADD emqx_backend_redis.conf /etc/emqx/plugins/
#ADD emqx_backend_mysql.conf /etc/emqx/plugins/
#ADD emqx_statsd.conf /etc/emqx/plugins/

RUN chown emqx -R /etc/emqx

ADD start.sh /

USER emqx

CMD ["/start.sh"]
