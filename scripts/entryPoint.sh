#!/bin/bash

export IMAPFILTER_HOME=/imapfilter/

if [ ! -e ${IMAPFILTER_HOME}/config.lua ]; then
    echo "please provide a config.lua from a configmap"
    exit 255
fi

while [ 1 -eq 1 ]; do
    imapfilter -l /dev/stdout -v
    sleep 500
done