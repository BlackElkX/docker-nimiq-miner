#!/bin/bash

set -e

/usr/share/nimiq/app/node /usr/share/nimiq/app/index.js --protocol=dumb --miner --pool=${POOL} --type=light --wallet-address=${WALLADDR}

exec "$@"