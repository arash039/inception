FROM debian:bullseye

RUN apt update -y 

RUN apt install php-fpm php-mysql -y

RUN apt install curl -y

COPY ./tools/script.sh /

RUN chmod +x /script.sh

COPY ./config/wp-config.php /

CMD [ "/script.sh" ]

