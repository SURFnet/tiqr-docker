# Tiqr-docker

This will install the tiqr server project to develop locally using a docker image

## Install

if you install this project for the first time, run:

- `docker-compose build`
- `docker-compose up`

and browse to 
- [Tiqr Demo Site (http)](http://localhost:84)
- [Tiqr Demo Site (https)](https://localhost)
- [SimpleSaml Admin Environment (http)](http://localhost:84/simplesaml) 
- [SimpleSaml Admin Environment (https)](https://localhost/simplesaml)
- [Oath Service (http)](http://localhost:85)
- [Oath Service docs (http)](http://localhost:85/api/doc/)

Login:

- Username: `admin`
- Password: /password/ (located in `config.php`)

The install script will install the following git repositories:
- https://github.com/simplesamlphp/simplesamlphp
- https://github.com/SURFnet/simplesamlphp-module-authtiqr
- https://github.com/SURFnet/tiqr-server-libphp
- https://github.com/intern/PHP-QR-Code
- https://github.com/zendframework/zf1
- https://github.com/SURFnet/simplesamlphp-module-themetiqr.git 
- https://github.com/SURFnet/tiqr-server-simplesamlphp.git 
- https://github.com/SURFnet/oath-service-php

Please note that the configuration for oath service won't be working out of the box. 
Please change the following in src/simplesamlphp/config/module_tiqr.php:

Before: `"apiURL" => 'http://localhost:85/',`

Change to: `"apiURL" => 'http://<your ip address>:85/',`

## Reinstall all GIT Repositories
When you start `docker-compose` with build or up, it will give the following warning:

```WARNING: The REINSTALL variable is not set. Defaulting to a blank string.```

The REINSTALL environment variable can be set if you want to reinstall all repositories. To use this feature run:
`REINSTALL=true docker-compose up`


## Testing with iOS

To test with iOS devices requires the use of https on a location reachable from the device (i.e. /not/ localhost).

This can be achieved using a reverse proxy. Several options exist:

#### [ngrok](https://ngrok.com/)

Use your favourite package manager (e.g. [brew](brew.sh) on osx) to install ngrok:

    brew cask install ngrok
    ngrok http 84

ngrok will tunnel https traffic to your local machine on port 84 from a custom URL, e.g https://ab12cd34.ngrok.io/simplesaml/

Because simplesamlphp needs to be aware that traffic is being proxied (ssp generates links and redirects to itself) this has to be updated in config:

    'baseurlpath' => 'https://ab12cd34.ngrok.io/simplesaml/',


#### [beame-insta-ssl](https://www.beame.io/insta-ssl)

Similar to ngrok, beame-insta-ssl is a free reverse proxy service. Install using:

    npm install beame-insta-ssl

You need to register and create credentials. See the [docs]npm install beame-insta-ssl

Build a tunnel:

    beame-insta-ssl tunnel make --dst 84 --proto http

Again, a tunnel will be established accessible from a custom URL like https://somerandomstring.v1.p.beameio.net
Update ssp config accordingly:

    'baseurlpath' => 'https://somerandomstring.v1.p.beameio.net/simplesaml/',

#### Roll your own

Build your own reverse proxy using SSH tunneling and nginx.

See for instance https://github.com/joostd/ssh-reverse-proxy

