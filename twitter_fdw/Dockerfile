FROM postgres:9.4

RUN apt-get update && \
    apt-get install -y git make postgresql-server-dev-9.4 gcc libcurl4-gnutls-dev

# Téléchargement de l'extension twitter
RUN cd /opt && \
    git clone https://github.com/umitanuki/twitter_fdw.git

# Installation de l'extension
RUN cd /opt/twitter_fdw && \
    make && \
    make install
