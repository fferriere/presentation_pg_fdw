#! /bin/bash

PROJECT_NAME="conf_pg_fdw-client"
export FFERRIERE_PG_DATA_NAME="$PROJECT_NAME-data"
export FFERRIERE_PG_SERVER_NAME="$PROJECT_NAME-server"

/opt/docker/postgresql/data/run.sh
/opt/docker/postgresql/server/run.sh

export DNSMASQ_FILENAME="conf_pg_fdw.conf"
export DNSMASQ_HOST_NAME="client.conf_pg_fdw.lan"
export DNSMASQ_IP_ADDRESS=$(docker inspect -f "{{.NetworkSettings.IPAddress}}" "$FFERRIERE_PG_SERVER_NAME")
./add_dns.sh
