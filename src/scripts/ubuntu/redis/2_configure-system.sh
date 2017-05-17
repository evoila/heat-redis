#!/bin/bash

# Tune kernel parameters

cat <<EOF > /etc/sysctl.d/60-redis-tuning.conf
vm.overcommit_memory = 1
net.core.somaxconn = 511
kernel.mm.transparent_hugepage.enabled = never
EOF

service procps restart

# Prepare storage path and symlink /var/lib/redis to the actual path. This is
# necessary since /etc/systemd/system/redis.service defines paths redis will be
# allowed to read. We could either modify this file or create a symlink.

mkdir /mnt/redis
chown -R redis:redis /mnt/redis
chmod -R 750 /mnt/redis

rm -fR /var/lib/redis
ln -s /mnt/redis /var/lib/redis
