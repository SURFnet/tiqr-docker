# Tiqr-docker

This will install the tiqr server project to develop locally using a docker image

## Install

if you install this project for the first time, run `install.sh` to install simplesamlphp and the authtiqr module, both projects will be checked out in the `web/src` directory.

After installing the source code you can run:
- `docker-compose build`
- `docker-compose up`

and browse to localhost port [84](http://localhost:84/simplesaml) or [443](https://localhost/simplesaml)

Login:
Username: admin
Password: password     (<= Located in config.php)
