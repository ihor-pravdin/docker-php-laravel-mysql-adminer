FROM mysql:5

WORKDIR /etc/mysql

ADD conf.d/config-file.cnf /etc/mysql/conf.d/config-file.cnf

RUN chmod 0664 /etc/mysql/conf.d/config-file.cnf

VOLUME ["/var/lib/mysql"]

EXPOSE 3306