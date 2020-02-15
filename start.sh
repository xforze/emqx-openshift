#!/bin/sh
sed "s/emqx@127.0.0.1/emqx@$(hostname -i)/g" -i /etc/emqx/emqx.conf
/usr/bin/emqx start
/pushgateway &
/usr/bin/emqx_ctl plugins load emqx_statsd
/usr/bin/emqx_ctl plugins load emqx_backend_mongo
/usr/bin/emqx_ctl plugins load emqx_auth_clientid
sleep infinity
