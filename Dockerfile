FROM postgres:10-alpine
MAINTAINER artb1sh ix (https://www.artbitika.ru)
ENV PG_WAL_KEEP_SEGMENTS 8
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

