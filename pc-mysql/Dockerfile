# Create MySQL image with initialization data

FROM mysql:latest

LABEL maintainer="Amir Katz <akrk1986@gmail.com>"

ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE petclinic

ADD . /mysql-init
WORKDIR /mysql-init

# Enable running interactive mysql commands w/o user/password
ADD .my.cnf /root

# Copy init SQL files
ADD init_files/* /docker-entrypoint-initdb.d/
