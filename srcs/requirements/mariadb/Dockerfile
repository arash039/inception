FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server 

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /

CMD ["/script.sh"]




