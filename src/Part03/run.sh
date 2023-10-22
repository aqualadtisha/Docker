#!/bin/bash

path=$(pwd)"/nginx/nginx.conf"

docker build . -t nginx:aqua
docker run -d -p 80:81 --name aqualadt_dockerfile \
      --mount src=$path,target=/etc/nginx/nginx.conf,type=bind nginx:aqua

curl localhost:80
curl localhost:80/status

dockle -ak NGINX_GPGKEY -ak NGINX_GPGKEY_PATH nginx:aqua

docker stop aqualadt_dockerfile
docker rm aqualadt_dockerfile
docker rmi -f nginx:aqua