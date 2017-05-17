#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"

apt-add-repository -y ppa:chris-lea/redis-server
apt-get update
apt-get install -y redis-server

service redis-server stop
