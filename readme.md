# Docker container for stand-alone Nimiq (NIM) crypto miner

## ENV variables
### VERSION
**Default: 1.5.7-1**

You can use this variable to change the official miner version. 

*See available versions at [nimiq repository](https://repo.nimiq.com/deb/pool/stable/main/n/nimiq/).*

### PROTO
**Default: dumb**

Set up the protocol to be used. **The only protocol supported right now is dumb**. Other protocols will be supported soon : wss (WebSocket Secure, requires a FQDN, port and SSL), ws (WebSocket, only requires public IP/FQDN and port).

### WALLADDR
**Default: NQ51BJ7CGJA4Y35XNL7KL9VVVYQNA0K76FMB**

Your wallet address, this is the address of your wallet available at [wallet.nimiq.com](https://wallet.nimiq.com/).

### POOL
**Default: eu.nimpool.io:8444**

The default pool for mining. You can choose the one you want at [nimiq.community/mining](https://nimiq.community/mining.html).

### TYPE
**Default: full**

Configure the consensus type to establish, one of full (default), light, or nano.

*See [nimiq community]{https://nimiq.community/2018/04/14/setting-up-nodejs_miner.html}*

### HOME
**Default: /home/nimiq**

The home directory of the user that will launch the nimiq miner. No need to change it.

This is a [Nimiq](https://nimiq.com) cryptocurrency miner.  Run it like

    $ docker run -d \
        --name nimiq-miner \
        --mount 'type=volume,source=nimiq-miner,destination=/home/nimiq' \
        pmietlicki/nimiq-miner \
        --pool=eu.nimpool.io:8444 \
        --wallet-address=NQ51BJ7CGJA4Y35XNL7KL9VVVYQNA0K76FMB

Or start it with `docker-compose up -d`:

    version: "3"
    services:
      nimiq-miner:
        image: pmietlicki/nimiq-miner
        command: --wallet-address=NQ51BJ7CGJA4Y35XNL7KL9VVVYQNA0K76FMB
        volumes:
          - nimiq-miner:/home/nimiq
        restart: on-failure
    volumes:
      nimiq-miner:

Of course, you need to replace the wallet with your own (but you are welcome to use mine ;-), and maybe change the pool if you fancy a different one, or simply go solo and leave out the pool argument.

You will then have a running Nimiq miner that uses all the available resources for mining.

To see the output from the miner, run one of:

    $ docker logs -t -f nimiq-miner
    $ docker-compose logs

To update the miner:

    $ docker stop nimiq-miner
    $ docker rm nimiq-miner
    $ docker pull pmietlicki/nimiq-miner
    $ docker run -d --mount ...

To stop the miner:

    $ docker stop nimiq-miner
    $ docker-compose stop

To restart the miner:

    $ docker restart nimiq-miner
    $ docker-compose restart

## Build

    $ cd src/miner
    $ docker build -t pmietlicki/nimiq-miner .

----

[![Docker build status](https://img.shields.io/docker/build/pmietlicki/nimiq-miner.svg)](https://hub.docker.com/r/pmietlicki/nimiq-miner/builds/)
