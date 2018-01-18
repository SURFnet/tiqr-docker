FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

####################
# apache2 server
RUN apt-get update  -y
RUN apt-get install -y git curl htop vim
RUN apt-get install -y apache2
RUN apt-get install -y apache2-doc apache2-suexec-pristine apache2-suexec-custom apache2-utils openssl-blacklist
RUN apt-get install -y libmcrypt-dev mcrypt
RUN apt-get install -y php5 libapache2-mod-php5 php5-mcrypt php-pear
RUN apt-get install -y php5-common php5-cli php5-curl php5-gmp php5-ldap
RUN apt-get install -y libapache2-mod-gnutls
RUN apt-get install -y php5-sqlite
RUN a2enmod gnutls


##########
#Permissions
RUN chown -R www-data /var/lib/php5

####################
# Composer
RUN echo "extension=mcrypt.so" >> /etc/php5/cli/php.ini
RUN echo "extension=mcrypt.so" >>  /etc/php5/mods-available/mcrypt.ini
RUN php5enmod mcrypt
WORKDIR /var/simplesamlphp
RUN curl -sS https://getcomposer.org/installer | php
RUN php composer.phar install

####################
# Final bits

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]