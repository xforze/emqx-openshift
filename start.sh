#!/bin/sh
sed "s/emqx@127.0.0.1/emqx@$(hostname)/g" -i /etc/emqx/emqx.conf
/usr/bin/emqx start
sleep infinity
