# Docker container for stand-alone Nimiq miner

This is a [Nimiq](https://nimiq.com) cryptocurrency miner.  Run it like

    $ docker run -d --name myminer jpsecher/nimiq-miner \
        --pool=eu.nimpool.io:8444 \
        --wallet-address=NQ46UGCV26ET160EE9VU5XHGQSXHYSUY2RVQ

Of course, you need to replace the wallet with your own (but you are welcome to use mine ;-), and maybe change the pool if you fancy a different one, or simply go solo and leave out the pool argument.

You will then have a running *dumb* Nimiq miner that uses all the available resources for mining.

To see the output from the miner, run

    $ docker logs -t -f myminer

To stop the miner:

    $ docker stop myminer

To restart the miner:

    $ docker restart myminer

## Build

    $ cd src/miner
    $ docker build -t jpsecher/nimiq-miner .

## Plan

- [x] Get a Nimiq miner up and running locally.
- [x] Make the Nimiq account configurable.
- [x] Get the miner to connect to a mining pool.
- [x] Mount a volume where the data is stored so that the container can be restarted without having to resync.
- [ ] Make a HTTP endpoint that reports the status of the miner.

