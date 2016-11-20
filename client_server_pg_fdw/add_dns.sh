#! /bin/bash

if [ ! -n "$DNSMASQ_IP_ADDRESS" ]; then
    >&2 echo "DNSMASQ_IP_ADDRESS does not exists !"
    exit 1;
fi

if [ ! -n "$DNSMASQ_HOST_NAME" ]; then
    >&2 echo "DNSMASQ_HOST_NAME does not exists !"
    exit 2
fi

if [ ! -n "$DNSMASQ_FILENAME" ]; then
    >&2 echo "DNSMASQ_FILENAME does not exists !"
    exit 3
fi

dirpath='/opt/docker/dnsmasq/dnsmasq/conf.d/'
if [ ! -d $dirpath ]; then
    >&2 echo "$dirpath does not exists";
    exit 4
fi

if [ ! -w $dirpath ]; then
    >&2 echo "$dirpath is not writable !";
    exit 5
fi

filepath="$dirpath$DNSMASQ_FILENAME";
if [ -n "$DNSMASQ_RESET_FILE" ] && [ "$DNSMASQ_RESET_FILE" -eq 1 ]; then
    echo "Reset file $DNSMASQ_FILENAME";
    echo '' > $filepath
fi

echo "address=/$DNSMASQ_HOST_NAME/$DNSMASQ_IP_ADDRESS" >> $filepath

if [ -n "$DNSMASQ_RELOAD" ] && [ "$DNSMASQ_RELOAD" -eq 1 ]; then
    echo "Reload dnsmasq"
    /opt/docker/dnsmasq/dnsmasq.sh reload
fi
