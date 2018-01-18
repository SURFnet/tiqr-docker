FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update  -y
RUN apt-get install -y git curl htop vim
RUN apt-get install -y apache2
RUN apt-get install -y apache2-doc apache2-suexec-pristine apache2-suexec-custom apache2-utils openssl-blacklist
RUN apt-get install -y libmcrypt-dev mcrypt
RUN apt-get install -y php5 libapache2-mod-php5 php5-mcrypt php-pear
RUN apt-get install -y php5-common php5-cli php5-curl php5-gmp php5-ldap php5-gd
RUN apt-get install -y libapache2-mod-gnutls
RUN apt-get install -y php5-sqlite
RUN a2enmod gnutls

ADD assets/apache2/tiqr.vhost /etc/apache2/sites-enabled/000-default.conf
ADD assets/entrypoint.sh /entrypoint.sh

RUN chown -R www-data /var/lib/php5


# logs should go to stdout / stderr
RUN set -ex \
    && ln -sf /proc/1/fd/1 "/var/log/apache2/error.log" \
    && ln -sf /proc/1/fd/1 "/var/log/apache2/other_vhosts_access.log" \
    && ln -sf /proc/1/fd/1 "/var/log/apache2/access.log"

EXPOSE 80
EXPOSE 443

WORKDIR /var/simplesamlphp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]