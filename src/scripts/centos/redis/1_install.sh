#!/bin/bash

yum install -y redis

# Enable redis server at system’s booting time
systemctl enable redis.service
