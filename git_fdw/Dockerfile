FROM postgres:9.6

RUN apt-get update && \
    apt-get install -y python3 python3-pip postgresql-9.6-python3-multicorn wget unzip

# Installation de brigit
RUN mkdir /opt/brigit && \
    cd /opt/brigit && \
    wget https://github.com/Kozea/brigit/archive/master.zip && \
    unzip master.zip && \
    pip3 install /opt/brigit/brigit-master

RUN apt-get install -y git

# Téléchargement d'un projet
RUN cd /opt && \
    git clone https://github.com/atoum/atoum.git

ENV POSTGRES_PASSWORD=postgres POSTGRES_HOST_AUTH=trust