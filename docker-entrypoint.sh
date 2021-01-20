#!/bin/bash

set -e

/usr/share/nimiq/app/node /usr/share/nimiq/app/index.js --protocol=${PROTO} --miner --pool=${POOL} --type=${TYPE} --wallet-address=${WALLADDR}

exec "$@"
