#!/usr/bin/env bash

mkdir -p /var/simplesamlphp/cert && openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout /var/simplesamlphp/cert/saml.pem -out /var/simplesamlphp/cert/saml.crt

cd /var/simplesamlphp
if [ ! -d "vendor/composer" ]; then
     echo "Installing dependencies..."
     curl -sS https://getcomposer.org/installer | php
     php composer.phar install
fi

exec "$@"