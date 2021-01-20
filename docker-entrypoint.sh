#!/bin/bash

set -e

if [ "$PROTO" = "ws" ]
then /usr/share/nimiq/app/node /usr/share/nimiq/app/index.js --protocol=ws --host={$HOST} --port=${PORT} --miner --pool=${POOL} --type=${TYPE} --wallet-address=${WALLADDR}
else /usr/share/nimiq/app/node /usr/share/nimiq/app/index.js --protocol=dumb --miner --pool=${POOL} --type=${TYPE} --wallet-address=${WALLADDR}
fi

exec "$@"
