#!/bin/bash

mkdir -p /usr/local/var/lib/alignak/ \
    && chown -R alignak:alignak /usr/local/var/lib/alignak/
mkdir -p /usr/local/var/log/alignak \
    && chown -R alignak:alignak /usr/local/var/log/alignak
mkdir -p /usr/local/var/run/alignak \
    && chown -R alignak:alignak /usr/local/var/run/alignak

/usr/bin/supervisord
