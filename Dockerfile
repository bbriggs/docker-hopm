FROM ubuntu:latest as builder

RUN apt-get update && apt-get install -y make=4.1-9.1ubuntu1 build-essential=12.4ubuntu1

RUN useradd -ms /bin/bash hopm
WORKDIR /home/hopm/build
COPY hopm-1.1.5.tgz .
RUN chown -R hopm:hopm .
USER hopm
RUN tar -xvf hopm-1.1.5.tgz
WORKDIR /home/hopm/build/hopm-1.1.5
RUN ./configure && make && make install

ENTRYPOINT /home/hopm/hopm/bin/hopm -d
