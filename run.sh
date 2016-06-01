#! /bin/bash

APP_PATH=$(dirname $(realpath $0))
cd $APP_PATH

DNSMASQ_RESET_FILE=1 ./run_server.sh
DNSMASQ_RELOAD=1 ./run_client.sh
