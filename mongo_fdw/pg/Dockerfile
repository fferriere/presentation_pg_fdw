FROM postgres:9.6

RUN apt-get update && \
    apt-get install -y postgresql-server-dev.9.6 git make gcc

# Installation de brigit
RUN cd /opt/ && \
    git clone --recursive https://github.com/EnterpriseDB/mongo_fdw.git && \
    mv mongo_fdw && \
    make && \
    make install
