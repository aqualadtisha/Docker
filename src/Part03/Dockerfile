FROM nginx:latest
LABEL authors="aqualadt"

COPY server/* /etc/nginx/

RUN apt-get update; \
    apt-get install -y gcc libfcgi-dev spawn-fcgi; \
    gcc /etc/nginx/server.c -lfcgi; \
    groupadd --gid 4222 aqualadt \
      && useradd --uid 1019618 --gid aqualadt --create-home aqualadt; \
    chown -R aqualadt /var/cache/nginx; \
    touch /var/run/nginx.pid; \
    chown aqualadt /var/run/nginx.pid; \
    rm -rf /var/lib/apt/lists

USER aqualadt

EXPOSE 81

ENTRYPOINT service nginx start; spawn-fcgi -p 8080 -n a.out;