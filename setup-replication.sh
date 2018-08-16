#!/bin/bash

if [ "x$REPLICATE_FROM" != "x" ]; then

cat > ${PGDATA}/recovery.conf <<EOF
standby_mode = on
primary_conninfo = 'host=${REPLICATE_FROM} port=5432 user=${POSTGRES_USER} password=${POSTGRES_PASSWORD}'
trigger_file = '/tmp/touch_me_to_master'
primary_slot_name = '${SLOT}'
EOF
chown postgres ${PGDATA}/recovery.conf
chmod 600 ${PGDATA}/recovery.conf
fi

