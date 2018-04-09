FROM mysql
ADD assets/oath-setup.sql /docker-entrypoint-initdb.d/oath-setup.sql
RUN chmod -R 775 /docker-entrypoint-initdb.d