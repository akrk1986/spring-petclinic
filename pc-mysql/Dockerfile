# Create MySQL image with initialization script

FROM mysql:latest
LABEL maintainer="Amir Katz <akrk1986@gmail.com>"

ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE test

ADD . /mysql-init
WORKDIR /mysql-init
#COPY *.sql /mysql-init

ENTRYPOINT ["/bin/bash", "/mysql-init/db-init.sh"]
