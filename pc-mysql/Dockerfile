# Create MySQL image with initialization script

FROM mysql:latest
LABEL maintainer="Amir Katz <akrk1986@gmail.com>"

ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE petclinic

ADD . /mysql-init
WORKDIR /mysql-init

ADD .my.cnf /root
#ADD my.cnf /etc

ADD init_files/* /docker-entrypoint-initdb.d/

#CMD ["/bin/bash", "/mysql-init/db-init.sh"]
#CMD ["mysql"]
