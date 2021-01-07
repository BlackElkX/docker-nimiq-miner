# Docker container for stand-alone Nimiq miner

##Version
*Default: 1.5.7-1*
You can use the ENV variable to change the version. 
*See available versions on [nimiq repository](https://repo.nimiq.com/deb/pool/stable/main/n/nimiq/)

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
