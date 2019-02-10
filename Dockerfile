FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common && \
add-apt-repository ppa:ondrej/php && apt-get update

RUN apt-get install -y --allow-unauthenticated php5.6 php5.6-mysql php5.6-mcrypt php5.6-cli php5.6-gd php5.6-curl mysql-server

RUN a2enmod php5.6
RUN a2enmod rewrite

ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

ENV MYSQL_ROOT_PASSWORD: "linda_mysql_pwd"
ENV MYSQL_DATABASE: "DevOps"
ENV MYSQL_USER: "root"
ENV MYSQL_PASSWORD: "linda_mysql_pwd"

ADD create_table.sql /create_table.sql
RUN chmod 775 /create_table.sql 

EXPOSE 80
EXPOSE 8080
EXPOSE 443
EXPOSE 3306

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

ADD run.sh /run.sh
RUN chmod 777 /run.sh 

ADD index.php /var/www/site/index.php

CMD ["/run.sh"]