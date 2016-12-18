FROM debian:jessie

RUN apt-get update && \
    apt-get install -y git golang wget

RUN cd /opt && \
    wget https://github.com/gitql/gitql/releases/download/v0.2.0/gitql && \
    chmod +x gitql

ENTRYPOINT [ "/opt/gitql", "query" ]
