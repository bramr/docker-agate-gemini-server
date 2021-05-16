FROM debian:buster-slim AS download

RUN apt update && apt install -y wget
RUN wget https://github.com/mbrubeck/agate/releases/download/v3.0.2/agate.x86_64-unknown-linux-gnu.gz \
 && gunzip *.gz \
 && mv agate.x86_64-unknown-linux-gnu /usr/local/bin/agate \
 && chmod +x /usr/local/bin/agate

FROM debian:buster-slim

COPY --from=download /usr/local/bin/agate /usr/local/bin/agate
RUN mkdir -p /usr/share/agate/content /usr/share/agate/.certificates
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY ./content/index.gmi /usr/share/agate/content

ENV AGATE_CERTS="/usr/share/agate/.certificates/"
ENV AGATE_CONTENT="/usr/share/agate/content/"
ENV AGATE_HOSTNAME="localhost"
ENV AGATE_LANG=

EXPOSE 1965/tcp

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["agate"]
