FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install nginx -y

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./app/static /app/static

EXPOSE 8080
CMD nginx -g 'daemon off;'