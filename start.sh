#!/bin/sh
sed "s/emqx@127.0.0.1/emqx@$(hostname -i)/g" -i /etc/emqx/emqx.conf
/usr/bin/emqx start
/usr/bin/emqx_ctl plugins load emqx_backend_mysql
sleep infinity
