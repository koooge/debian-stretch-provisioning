#!/bin/bash

# Usage: `./install_redis.sh`

REDIS_VERSION=3.2.9

wget http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz
tar xzf redis-${REDIS_VERSION}.tar.gz
cd redis-${REDIS_VERSION}
make

cd -
mv redis-${REDIS_VERSION} ${HOME}/
rm redis-${REDIS_VERSION}.tar.gz
