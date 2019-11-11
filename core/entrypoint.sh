#!/bin/bash

mkdir -p /usr/local/var/lib/alignak/ \
    && chown -R alignak:alignak /usr/local/var/lib/alignak/
mkdir -p /usr/local/var/log/alignak \
    && chown -R alignak:alignak /usr/local/var/log/alignak
mkdir -p /usr/local/var/run/alignak \
    && chown -R alignak:alignak /usr/local/var/run/alignak

sed -e 's/;process_performance_data=1/process_performance_data=1/'

sed -i \
    -e 's/;modules=backend_broker, logs/modules=backend_broker/' \
    -e 's/;modules=backend_scheduler/modules=backend_scheduler/' \
    -e 's/;modules=backend_arbiter/modules=backend_arbiter/' \
    -e 's/;host=127.0.0.1/host=0.0.0.0/g' \
    /usr/local/share/alignak/etc/alignak.d/daemons.ini

sed -i \
    's#api_url=http://127.0.0.1:5000#api_url=http://backend:5000#' \
    /usr/local/share/alignak/etc/alignak.d/backend-broker.ini
sed -i \
    's#api_url=http://127.0.0.1:5000#api_url=http://backend:5000#' \
    /usr/local/share/alignak/etc/alignak.d/backend-arbiter.ini
sed -i \
    's#api_url=http://127.0.0.1:5000#api_url=http://backend:5000#' \
    /usr/local/share/alignak/etc/alignak.d/backend-scheduler.ini

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
