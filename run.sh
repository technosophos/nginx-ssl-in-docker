#!/bin/bash

# Note: if you change the names of these files, you need to edit the nginx.conf
private=./ssl.key
public=./ssl.pub
nginxconf=./nginx.conf

if [[ "gencert" == $1 ]]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $private -out $public
fi

docker run --name nginx-ssl \
  -v $PWD/www:/data/www \
  -v $PWD/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v $PWD/ssl.key:/etc/nginx/ssl.key:ro \
  -v $PWD/ssl.pub:/etc/nginx/ssl.pub:ro \
  -p 4433:443 \
  --rm \
  nginx
  