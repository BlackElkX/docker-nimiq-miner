FROM ubuntu:16.04

RUN apt-get update && apt-get -y install -y curl gnupg

# Get repo key and install it
RUN curl -L https://www.nimiq.com/nimiq-signing-key.pub | apt-key add -

ENV VERSION=1.5.7-1
RUN cd / && curl -O https://repo.nimiq.com/deb/pool/stable/main/n/nimiq/nimiq_${VERSION}_amd64.deb.asc
RUN cd / && curl -O https://repo.nimiq.com/deb/pool/stable/main/n/nimiq/nimiq_${VERSION}_amd64.deb.sha256sum
RUN curl -O https://repo.nimiq.com/deb/pool/stable/main/n/nimiq/nimiq_${VERSION}_amd64.deb && \
    sha256sum -c nimiq_${VERSION}_amd64.deb.sha256sum && \
    dpkg -i nimiq_${VERSION}_amd64.deb && \
    rm -f nimiq_${VERSION}_amd64.deb nimiq_${VERSION}_amd64.deb.asc nimiq_${VERSION}_amd64.deb.sha256sum

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENV HOME=/home/nimiq
RUN mkdir -p $HOME && chown nimiq:nimiq $HOME
WORKDIR $HOME
USER nimiq

ENV PROTO=dumb
ENV HOST=local.localhost
ENV PORT=8080
ENV WALLADDR=NQ51BJ7CGJA4Y35XNL7KL9VVVYQNA0K76FMB
ENV POOL=eu.nimpool.io:8444
ENV TYPE=full

ENTRYPOINT ["docker-entrypoint.sh"]
