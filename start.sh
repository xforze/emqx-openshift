#!/bin/sh
sed "s/emqx@127.0.0.1/emqx@$(hostname -i)/g" -i /etc/emqx/emqx.conf
#sleep 60
/usr/bin/emqx start
#/usr/bin/emqx_ctl plugins load emqx_backend_redis
sleep infinity
