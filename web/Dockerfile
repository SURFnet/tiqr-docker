FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update  -qq
RUN apt-get install -y language-pack-en-base && export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN LC_ALL=C.UTF-8 apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
RUN apt-get update
RUN apt-get install -y git curl htop vim unzip ntpdate oathtool
RUN apt-get install -y apache2
RUN apt-get install -y apache2-doc apache2-suexec-pristine apache2-suexec-custom apache2-utils openssl-blacklist
RUN apt-get install -y libmcrypt-dev mcrypt
RUN apt-get install -y php5.6 libapache2-mod-php5.6 php5.6-mcrypt php5.6-common php5.6-cli php5.6-curl php5.6-gmp php5.6-ldap php5.6-gd php5.6-sqlite php5.6-xml php5.6-mbstring php5.6-zip php5.6-intl php5.6-xmlrpc php5.6-soap php5.6-mysql php5.6-bcmath
RUN apt-get install -y php-pear
RUN apt-get install -y libapache2-mod-gnutls
RUN a2enmod gnutls
RUN a2enmod rewrite

ADD assets/apache2/tiqr.vhost /etc/apache2/sites-available/tiqr.conf
ADD assets/apache2/oath-service.vhost /etc/apache2/sites-available/oath-service.conf
ADD assets/apache2/ports.conf /etc/apache2/ports.conf
RUN a2dissite 000-default
RUN a2ensite tiqr
RUN a2ensite oath-service

ADD assets/entrypoint.sh /entrypoint.sh
COPY assets /assets

# logs should go to stdout / stderr
RUN set -ex \
    && ln -sf /proc/1/fd/1 "/var/log/apache2/error.log" \
    && ln -sf /proc/1/fd/1 "/var/log/apache2/other_vhosts_access.log" \
    && ln -sf /proc/1/fd/1 "/var/log/apache2/access.log"

EXPOSE 80
EXPOSE 81
EXPOSE 443

WORKDIR /src

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]