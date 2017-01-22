#!/bin/bash

redis-data=`pwd`/redis_data
docker run --rm -p 6379:6379 -v ${redis-data}:/data -v ${redis-data}/redis.conf:/usr/local/etc/redis/redis.conf redis:3.0-alpine redis-server --appendonly yes

java -jar app.jar