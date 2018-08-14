#!/bin/bash

if [ "x$REPLICATE_FROM" == "x" ]; then

cat >> ${PGDATA}/postgresql.conf <<EOF
wal_keep_segments = $PG_WAL_KEEP_SEGMENTS
EOF

else

cat > ${PGDATA}/recovery.conf <<EOF
standby_mode = on
primary_conninfo = 'host=${REPLICATE_FROM} port=5432 user=${POSTGRES_USER} password=${POSTGRES_PASSWORD}'
trigger_file = '/tmp/touch_me_to_master'
EOF
chown postgres ${PGDATA}/recovery.conf
chmod 600 ${PGDATA}/recovery.conf
fi

