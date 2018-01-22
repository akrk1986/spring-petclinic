#!/bin/bash

export DB_USER=root
export DB_PASS=root
export DB_NAME=petclinic
export DB_HOST=127.0.0.1
export ORIG_DB=test

echo "copy config file"
cp .my.cnf /root
chmod 600 /root/.my.cnf

echo "Start MySQL"
/etc/init.d/mysql start

echo "Create DB schema"
CMD="mysql -h ${DB_HOST} ${ORIG_DB} <schema.sql"
echo "CMD=${CMD}"
echo "================"
${CMD}

if [ $? -ne 0 ]; then
    echo "FAILED!!"
    exit 1
fi

echo "Insert/update DB data"
CMD="mysql -h 127.0.0.1 ${DB_NAME} <data.sql"
echo "CMD=${CMD}"
echo "================"
${CMD}

