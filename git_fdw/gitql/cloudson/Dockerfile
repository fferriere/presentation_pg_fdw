FROM debian:jessie

RUN apt-get update && \
    apt-get install -y git golang cmake pkg-config

ENV GOPATH /opt

RUN cd /opt && \
    go get -u -d github.com/cloudson/gitql && \
    cd $GOPATH/src/github.com/cloudson/gitql && \
    make && \
    make install
