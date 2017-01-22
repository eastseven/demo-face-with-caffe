#!/bin/bash

redisdata=`pwd`/redis_data
if [ ! -f "${redisdata}" ]; then
  mkdir -p ${redisdata};
fi

docker stop face_redis
docker rm face_redis
docker run -d --name face_redis -p 10.27.68.95:6379:6379 -v ${redisdata}:/data redis:3.0-alpine redis-server --appendonly yes

docker ps
sleep 3s

java -jar app.jar