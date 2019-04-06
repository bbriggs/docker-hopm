FROM ubuntu as builder

RUN apt-get update && apt-get install -y wget make build-essential

RUN mkdir -p /app

WORKDIR /build

RUN wget https://astuteinternet.dl.sourceforge.net/project/ircd-hybrid/hopm/hopm-1.1.5/hopm-1.1.5.tgz

RUN tar -xvf hopm-1.1.5.tgz

WORKDIR /build/hopm-1.1.5

RUN ./configure && make && make install

FROM ubuntu

WORKDIR /app

COPY --from=builder /root/hopm .

ENTRYPOINT /bin/bash
