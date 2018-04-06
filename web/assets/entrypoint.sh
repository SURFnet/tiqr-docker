#!/usr/bin/env bash

# Remove old directories
if [ -d "/src/simplesamlphp" ]; then
  echo "Remove old simplesamlphp directory"
  rm -Rf /src/simplesamlphp
fi

if [ -d "/src/simplesamlphp-module-authtiqr" ]; then
  echo "Remove old simplesamlphp-module-authtiqr directory"
  rm -Rf /src/simplesamlphp-module-authtiqr
fi

if [ -d "/src/tiqr-server-libphp" ]; then
  echo "Remove old tiqr-server-libphp directory"
  rm -Rf /src/tiqr-server-libphp
fi

if [ -d "/src/php-qr-code" ]; then
  echo "Remove old php-qr-code directory"
  rm -Rf /src/php-qr-code
fi

if [ -d "/src/zf1" ]; then
  echo "Remove old zf1 directory"
  rm -Rf /src/zf1
fi

if [ -d "/src/simplesamlphp-module-themetiqr" ]; then
  echo "Remove old simplesamlphp-module-themetiqr directory"
  rm -Rf /src/simplesamlphp-module-themetiqr
fi

# Clone repositories
echo "Clone required repositories..."
echo "Clone simplesamlphp ..."
git clone https://github.com/simplesamlphp/simplesamlphp.git /src/simplesamlphp
echo "Clone simplesamlphp module authtiqr ..."
git clone https://github.com/SURFnet/simplesamlphp-module-authtiqr.git /src/simplesamlphp-module-authtiqr
echo "Clone tiqr server libphp ..."
git clone https://github.com/SURFnet/tiqr-server-libphp.git /src/tiqr-server-libphp
echo "Clone PHP QR Code ..."
git clone https://github.com/intern/PHP-QR-Code.git /src/php-qr-code
echo "Clone ZendFramework 1 ..."
git clone https://github.com/zendframework/zf1.git /src/zf1
echo "Clone simplesamlphp module themetiqr ..."
git clone https://github.com/SURFnet/simplesamlphp-module-themetiqr.git /src/simplesamlphp-module-themetiqr

# Copy default configuration
echo "Copy default configuration..."
mkdir -p /src/simplesamlphp/config && cp -r /src/simplesamlphp/config-templates/* /src/simplesamlphp/config/
mkdir -p /src/simplesamlphp/metadata && cp -r /src/simplesamlphp/metadata-templates/* /src/simplesamlphp/metadata/

# Copy tiqr configuration
echo "Copy tiqr configuration files..."
cp /assets/simplesamlphp/config/config.php /src/simplesamlphp/config/config.php
cp /assets/simplesamlphp/config/module_tiqr.php /src/simplesamlphp/config/module_tiqr.php
cp /assets/simplesamlphp/config/authsources.php /src/simplesamlphp/config/authsources.php

# Create symlinks
echo "Create symlinks for all repositories..."
mkdir -p /src/simplesamlphp/modules
ln -s /src/simplesamlphp-module-authtiqr /src/simplesamlphp/modules/authTiqr
ln -s /src/simplesamlphp /var/simplesamlphp
ln -s /src/tiqr-server-libphp /var/libTiqr
ln -s /src/php-qr-code /var/php-qr-code
ln -s /src/zf1 /var/zendframework1
ln -s /src/simplesamlphp-module-themetiqr /src/simplesamlphp/modules/themeTiqr

# Generate ssl certificate
echo "Generate SSL Certificate..."
mkdir -p /src/simplesamlphp/cert && openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout /src/simplesamlphp/cert/saml.pem -out /src/simplesamlphp/cert/saml.crt

cd /src/simplesamlphp
if [ ! -d "vendor/composer" ]; then
     echo "Installing dependencies..."
     curl -sS https://getcomposer.org/installer | php
     php composer.phar install
fi

exec "$@"