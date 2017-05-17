#!/bin/bash

MASTER_NAME=${MASTER_NAME}
MASTER_PASSWORD=${MASTER_PASSWORD}
MASTER_ADDRESS=${MASTER_ADDRESS}

# Write sentinel configuration

cat <<EOF > /etc/redis/sentinel.conf
daemonize yes
pidfile "/var/run/redis/redis-sentinel.pid"
logfile "/var/log/redis/redis-sentinel.log"
bind 0.0.0.0
protected-mode yes
port 26379
dir "/mnt/redis"
sentinel monitor $MASTER_NAME $MASTER_ADDRESS 6379 2
sentinel auth-pass $MASTER_NAME $MASTER_PASSWORD
sentinel config-epoch $MASTER_NAME 0
sentinel leader-epoch $MASTER_NAME 0
EOF

# Restart sentinel

service redis-sentinel restart
