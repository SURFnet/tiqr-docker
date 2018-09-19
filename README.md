# Tiqr-docker

This will install the tiqr server project to develop locally using a docker image

## Install

if you install this project for the first time, run `install.sh` to install simplesamlphp and the authtiqr module, both projects will be checked out in the `web/src` directory.

After installing the source code you can run:
- `docker-compose build`
- `docker-compose up`

and browse to http://localhost:84/simplesaml or https://localhost/simplesaml.

Login:

- Username: `admin`
- Password: /password/ (located in `config.php`)

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

