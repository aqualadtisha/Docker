FROM nginx:latest
LABEL authors="aqualadt"

COPY server/* /etc/nginx/

RUN apt-get update; \
    apt-get install -y gcc libfcgi-dev spawn-fcgi; \
    gcc /etc/nginx/server.c -lfcgi;

EXPOSE 81

ENTRYPOINT service nginx start; spawn-fcgi -p 8080 -n a.out;