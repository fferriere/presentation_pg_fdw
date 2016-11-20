# Présentation des FOREIGN DATA WRAPPER de PostgreSQL

Le Foreign Data Wrapper est un système interne de PostgreSQL qui permet à une instance de se connecter à (au moins) un fournisseur de données.
Il existe une multitude de fournisseur de données compatible, voici la [liste des connecteurs](https://wiki.postgresql.org/wiki/Foreign_data_wrappers).
Ce projet se focalisera sur la solution `postgres_fdw` qui permet de connecter une instance PostgreSQL avec une autre instance PostgreSQL.

## Slides

Vous pouvez trouver ci-dessous le support de ma conférence présentant les Foreign Data Wrapper.

[Slides de la présentation](./slides/index.html)

## Exemples

Pour m'aider dans le support de présentation j'ai créer des exemples.
À ce jour il y a deux exemples.
Un premier présente une utilisation de `postgres_fdw` en client/server.
Le second présente une utilisation de `git` avec les Foreign Data Wrapper.

### postgres_fdw

Une explication de cet exemple est trouvable dans ce [README.md](./client_server_pg_fdw/README.md).

### git

Une explication de cet exemplte est trouve dans ce [README.md](./git_fdw/README.md).
