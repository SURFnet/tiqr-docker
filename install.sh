#!/usr/bin/env bash
rm -Rf web/src/simplesamlphp /web/src/simplesamlphp-module-authtiqr web/src/tiqr-server-libphp web/src/php-qr-code web/src/zf1
git clone git@github.com:simplesamlphp/simplesamlphp.git web/src/simplesamlphp
git clone git@github.com:SURFnet/simplesamlphp-module-authtiqr.git web/src/simplesamlphp-module-authtiqr
git clone git@github.com:SURFnet/tiqr-server-libphp.git web/src/tiqr-server-libphp
git clone git@github.com:intern/PHP-QR-Code.git web/src/php-qr-code
git clone git@github.com:zendframework/zf1.git web/src/zf1

mkdir -p web/src/simplesamlphp/config && cp -r web/src/simplesamlphp/config-templates/* web/src/simplesamlphp/config/
mkdir -p web/src/simplesamlphp/metadata && cp -r web/src/simplesamlphp/metadata-templates/* web/src/simplesamlphp/metadata/

cp web/assets/simplesamlphp/config/config.php web/src/simplesamlphp/config/config.php
cp web/assets/simplesamlphp/config/module_tiqr.php web/src/simplesamlphp/config/module_tiqr.php
cp web/assets/simplesamlphp/config/authsources.php web/src/simplesamlphp/config/authsources.php