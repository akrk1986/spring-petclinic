#!/bin/bash

export DB_NAME=petclinic
export DB_HOST=127.0.0.1
export ORIG_DB=test

#echo "1 - copy config file"
#cp .my.cnf /root
#chmod 600 /root/.my.cnf

#echo "2 - Start MySQL"
#/etc/init.d/mysql start

echo "3 - Create DB schema"
CMD="mysql -v -h ${DB_HOST} ${ORIG_DB} <schema.sql"
echo "CMD=${CMD}"
echo "================"
${CMD}

if [ $? -ne 0 ]; then
    echo "FAILED!!"
    exit 1
fi

echo "4 - Insert/update DB data"
CMD="mysql -h ${DB_HOST} ${DB_NAME} <data.sql"
echo "CMD=${CMD}"
echo "================"
${CMD}
