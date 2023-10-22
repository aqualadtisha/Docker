#!/bin/bash

docker-compose build
docker-compose up -d

curl localhost:80
curl localhost:80/status

docker stop server
docker stop proxy
docker rm server
docker rm proxy
docker rmi nginx
docker rmi 06_server